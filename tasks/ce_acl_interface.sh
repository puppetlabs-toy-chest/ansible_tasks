#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_direction+x}" ];
  then params="${params} direction=\"${PT_direction}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_acl_name+x}" ];
  then params="${params} acl_name=\"${PT_acl_name}\""
fi

ansible localhost -m ce_acl_interface --args "${params}" --one-line | cut -f2- -d">"