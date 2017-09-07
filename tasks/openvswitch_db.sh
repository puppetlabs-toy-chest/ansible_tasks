#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_record+x}" ];
  then params="${params} record=\"${PT_record}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_column+x}" ];
  then params="${params} column=\"${PT_column}\""
fi

if [ ! -z "${PT_table+x}" ];
  then params="${params} table=\"${PT_table}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

ansible localhost -m openvswitch_db --args "${params}" --one-line | cut -f2- -d">"