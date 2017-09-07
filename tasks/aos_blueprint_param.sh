#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_blueprint+x}" ];
  then params="${params} blueprint=\"${PT_blueprint}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_session+x}" ];
  then params="${params} session=\"${PT_session}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_get_param_list+x}" ];
  then params="${params} get_param_list=\"${PT_get_param_list}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

if [ ! -z "${PT_param_map+x}" ];
  then params="${params} param_map=\"${PT_param_map}\""
fi

ansible localhost -m aos_blueprint_param --args "${params}" --one-line | cut -f2- -d">"