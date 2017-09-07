#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_creates+x}" ];
  then params="${params} creates=\"${PT_creates}\""
fi

if [ ! -z "${PT_free_form+x}" ];
  then params="${params} free_form=\"${PT_free_form}\""
fi

if [ ! -z "${PT_chdir+x}" ];
  then params="${params} chdir=\"${PT_chdir}\""
fi

if [ ! -z "${PT_removes+x}" ];
  then params="${params} removes=\"${PT_removes}\""
fi

if [ ! -z "${PT_executable+x}" ];
  then params="${params} executable=\"${PT_executable}\""
fi

ansible localhost -m win_shell --args "${params}" --one-line | cut -f2- -d">"