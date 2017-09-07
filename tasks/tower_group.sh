#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_credential+x}" ];
  then params="${params} credential=\"${PT_credential}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_overwrite_vars+x}" ];
  then params="${params} overwrite_vars=\"${PT_overwrite_vars}\""
fi

if [ ! -z "${PT_source_regions+x}" ];
  then params="${params} source_regions=\"${PT_source_regions}\""
fi

if [ ! -z "${PT_variables+x}" ];
  then params="${params} variables=\"${PT_variables}\""
fi

if [ ! -z "${PT_tower_username+x}" ];
  then params="${params} tower_username=\"${PT_tower_username}\""
fi

if [ ! -z "${PT_tower_password+x}" ];
  then params="${params} tower_password=\"${PT_tower_password}\""
fi

if [ ! -z "${PT_tower_config_file+x}" ];
  then params="${params} tower_config_file=\"${PT_tower_config_file}\""
fi

if [ ! -z "${PT_overwrite+x}" ];
  then params="${params} overwrite=\"${PT_overwrite}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_source_vars+x}" ];
  then params="${params} source_vars=\"${PT_source_vars}\""
fi

if [ ! -z "${PT_source_script+x}" ];
  then params="${params} source_script=\"${PT_source_script}\""
fi

if [ ! -z "${PT_update_on_launch+x}" ];
  then params="${params} update_on_launch=\"${PT_update_on_launch}\""
fi

if [ ! -z "${PT_tower_verify_ssl+x}" ];
  then params="${params} tower_verify_ssl=\"${PT_tower_verify_ssl}\""
fi

if [ ! -z "${PT_instance_filters+x}" ];
  then params="${params} instance_filters=\"${PT_instance_filters}\""
fi

if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_group_by+x}" ];
  then params="${params} group_by=\"${PT_group_by}\""
fi

if [ ! -z "${PT_inventory+x}" ];
  then params="${params} inventory=\"${PT_inventory}\""
fi

if [ ! -z "${PT_tower_host+x}" ];
  then params="${params} tower_host=\"${PT_tower_host}\""
fi

ansible localhost -m tower_group --args "${params}" --one-line | cut -f2- -d">"