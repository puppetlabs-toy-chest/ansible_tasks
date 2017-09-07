#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_policy+x}" ];
  then params="${params} policy=\"${PT_policy}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_conf+x}" ];
  then params="${params} conf=\"${PT_conf}\""
fi

ansible localhost -m selinux --args "${params}" --one-line | cut -f2- -d">"