#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_origin+x}" ];
  then params="${params} origin=\"${PT_origin}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_key_value+x}" ];
  then params="${params} key_value=\"${PT_key_value}\""
fi

ansible localhost -m zfs --args "${params}" --one-line | cut -f2- -d">"