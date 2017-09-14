#!/usr/bin/env python

# $ make_tasks.py [puppet tasksdir]
# This script will convert the installed ansible modules into native tasks It
# does this by building the ansibleball then modifying it to read input from
# stdin Because the ansiball contains a zip file rerunning this script will
# result in changes to all tasks.  TODO: parse the ansiball instead of doing a
# string replace

import base64
import glob
import json
import os
import re
import sys
import tempfile
import zipfile

from ansible import constants as C
from ansible.executor.module_common import modify_module
from ansible.plugins import module_loader
import ansible.utils.plugin_docs as plugin_docs

def find_modules():
  plugins = set()
  paths = module_loader._get_paths()
  for path in paths:
      if not os.path.exists(path):
          continue
      for plugin in os.listdir(path):
          full_path = '/'.join([path, plugin])
          if plugin.startswith('.'):
              continue
          elif os.path.isdir(full_path):
              continue
          elif any(plugin.endswith(x) for x in C.BLACKLIST_EXTS):
              continue
          elif plugin.startswith('__'):
              continue
          elif plugin in C.IGNORE_FILES:
              continue
          elif plugin .startswith('_'):
              if os.path.islink(full_path):  # avoids aliases
                  continue

          plugin = os.path.splitext(plugin)[0]  # removes the extension
          plugin = plugin.lstrip('_')  # remove underscore from deprecated plugins

          if plugin not in plugin_docs.BLACKLIST.get("MODULE", ()):
              plugins.add(plugin)

  return [module_loader.find_plugin(p, mod_type='.py', ignore_deprecated=True) for p in plugins]


def load_metadata(module_path):
  "Ansible doesn't call this metadata but doc?"
  return plugin_docs.get_docstring(module_path)[0]

def make_param(opt):
  choices = opt.get('choices', False)
  if choices:
    choices = ['"%s"' % c for c in choices]
    typ = 'Enum[%s]' % ', '.join(choices)
  else:
    typ = 'String[0]'

  if (not opt.get('required', False)) or opt.get('default', False):
    typ = 'Optional[%s]' % typ

  desc = opt.get('description', [''])[0]
  return { 'description': desc, 'type': typ }


def make_metadata(doc):
  metadata = {'description': doc.get('description', [''])[0],
              'input_method': 'stdin',
              'parameters': {}}

  for name, opt in doc['options'].iteritems():
    metadata['parameters'][name] = make_param(opt)
  return metadata


def make_task(module_path, task_dir):
  "This makes a task that will read arguments from stdin from an ansible module"

  try:
    doc = load_metadata(module_path)
    module_name = doc['module']
    print "making %s task" % module_name
  except:
    sys.stderr.write("failed to build module %s couldn't find it's name\n" % module_path)
    return

  taskfile = os.path.join(task_dir, '%s.py' % module_name)
  metadatafile = os.path.join(task_dir, '%s.json' % module_name)

  metadata = make_metadata(doc)

  sigil = "&@SIGIL@&"
  ball = modify_module(module_name, module_path, sigil)[0]
  # Replace the sigil
  find = '\'{"ANSIBLE_MODULE_ARGS": "' + sigil + '"}\''
  replace = 'json.dumps({"ANSIBLE_MODULE_ARGS": json.load(sys.stdin)})'

  # Some modules are just metadata stubs. Don't make the tast if there aren't
  # ANSIBALLZ_PARAMS to set.
  if ball.find(find) == -1:
    sys.stderr.write("failed to build module %s couldn't find ANSIBALLZ_PARAMS.\n" % module_name)
    return
  else:
    ball = ball.replace(find, replace)

  find = 'import base64'
  replace = 'import base64\nimport json'
  ball = ball.replace(find, replace)

  with open(taskfile, 'w') as fh:
    fh.write(ball)
  os.chmod(taskfile, 0755)
  with open(metadatafile, 'w') as fh:
    json.dump(metadata, fh, indent=2)


if __name__ == '__main__':

  if len(sys.argv) > 1:
    task_dir = sys.argv[1]
  else:
    task_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), 'tasks'))

  for module_path in find_modules():
   make_task(module_path, task_dir)
