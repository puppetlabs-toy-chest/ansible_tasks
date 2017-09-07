#!/usr/bin/env python

from ansible import constants as C
from ansible.plugins import module_loader
from ansible.utils import plugin_docs
import json
import os

all_plugins = set()

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
            all_plugins.add(plugin)

param_map = {'string': 'String',
             'bool': 'Boolean'}

for plugin in all_plugins:
    filename = module_loader.find_plugin(plugin, mod_type='.py', ignore_deprecated=True)
    doc, _, _, _ = plugin_docs.get_docstring(filename)
    desc = doc['short_description']
    options = doc['options']
    params = {}
    # TODO handle free_form
    for opt in options:
        details = options[opt]
        if options.has_key('choices'):
            param_type = "Enum[%s]" % ", ".join(options['choices'])
        else:
            param_type = param_map.get(details.get('type', 'string'))

        if not details.get('required', False):
            param_type = "Optional[%s]" % param_type
        params[opt] = {"description": " ".join(details['description']), "type": param_type}
    #params = options
    print(plugin)
    with open("tasks/%s.json" % plugin, 'w') as f:
        f.write(json.dumps({"description": desc, "parameters": params}, indent=2))

    with open("tasks/%s.sh" % plugin, 'w') as f:
        script = '''#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
'''

        for opt in options:
            param_str = '''if [ ! -z "${PT_%s+x}" ];
  then params="${params} %s=\\"${PT_%s}\\""
fi

'''
            script += param_str % (opt, opt, opt)

        script += 'ansible localhost -m %s --args "${params}" --one-line' % plugin

        f.write(script)
