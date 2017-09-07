#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_prefix+x}" ];
  then params="${params} prefix=\"${PT_prefix}\""
fi

if [ ! -z "${PT_suffix+x}" ];
  then params="${params} suffix=\"${PT_suffix}\""
fi

ansible localhost -m tempfile --args "${params}" --one-line | cut -f2- -d">"