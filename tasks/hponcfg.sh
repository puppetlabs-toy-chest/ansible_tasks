#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_minfw+x}" ];
  then params="${params} minfw=\"${PT_minfw}\""
fi

ansible localhost -m hponcfg --args "${params}" --one-line | cut -f2- -d">"