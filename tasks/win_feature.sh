#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_include_management_tools+x}" ];
  then params="${params} include_management_tools=\"${PT_include_management_tools}\""
fi

if [ ! -z "${PT_include_sub_features+x}" ];
  then params="${params} include_sub_features=\"${PT_include_sub_features}\""
fi

if [ ! -z "${PT_restart+x}" ];
  then params="${params} restart=\"${PT_restart}\""
fi

ansible localhost -m win_feature --args "${params}" --one-line | cut -f2- -d">"