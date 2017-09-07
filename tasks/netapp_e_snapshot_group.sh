#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_repo_pct+x}" ];
  then params="${params} repo_pct=\"${PT_repo_pct}\""
fi

if [ ! -z "${PT_warning_threshold+x}" ];
  then params="${params} warning_threshold=\"${PT_warning_threshold}\""
fi

if [ ! -z "${PT_rollback_priority+x}" ];
  then params="${params} rollback_priority=\"${PT_rollback_priority}\""
fi

if [ ! -z "${PT_delete_limit+x}" ];
  then params="${params} delete_limit=\"${PT_delete_limit}\""
fi

if [ ! -z "${PT_api_password+x}" ];
  then params="${params} api_password=\"${PT_api_password}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_storage_pool_name+x}" ];
  then params="${params} storage_pool_name=\"${PT_storage_pool_name}\""
fi

if [ ! -z "${PT_api_username+x}" ];
  then params="${params} api_username=\"${PT_api_username}\""
fi

if [ ! -z "${PT_base_volume_name+x}" ];
  then params="${params} base_volume_name=\"${PT_base_volume_name}\""
fi

if [ ! -z "${PT_full_policy+x}" ];
  then params="${params} full_policy=\"${PT_full_policy}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_api_url+x}" ];
  then params="${params} api_url=\"${PT_api_url}\""
fi

ansible localhost -m netapp_e_snapshot_group --args "${params}" --one-line | cut -f2- -d">"