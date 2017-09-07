#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_segment_size_kb+x}" ];
  then params="${params} segment_size_kb=\"${PT_segment_size_kb}\""
fi

if [ ! -z "${PT_thin_provision+x}" ];
  then params="${params} thin_provision=\"${PT_thin_provision}\""
fi

if [ ! -z "${PT_api_password+x}" ];
  then params="${params} api_password=\"${PT_api_password}\""
fi

if [ ! -z "${PT_api_url+x}" ];
  then params="${params} api_url=\"${PT_api_url}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_ssd_cache_enabled+x}" ];
  then params="${params} ssd_cache_enabled=\"${PT_ssd_cache_enabled}\""
fi

if [ ! -z "${PT_ssid+x}" ];
  then params="${params} ssid=\"${PT_ssid}\""
fi

if [ ! -z "${PT_data_assurance_enabled+x}" ];
  then params="${params} data_assurance_enabled=\"${PT_data_assurance_enabled}\""
fi

if [ ! -z "${PT_size_unit+x}" ];
  then params="${params} size_unit=\"${PT_size_unit}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_storage_pool_name+x}" ];
  then params="${params} storage_pool_name=\"${PT_storage_pool_name}\""
fi

if [ ! -z "${PT_thin_volume_max_repo_size+x}" ];
  then params="${params} thin_volume_max_repo_size=\"${PT_thin_volume_max_repo_size}\""
fi

if [ ! -z "${PT_api_username+x}" ];
  then params="${params} api_username=\"${PT_api_username}\""
fi

if [ ! -z "${PT_thin_volume_repo_size+x}" ];
  then params="${params} thin_volume_repo_size=\"${PT_thin_volume_repo_size}\""
fi

if [ ! -z "${PT_size+x}" ];
  then params="${params} size=\"${PT_size}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m netapp_e_volume --args "${params}" --one-line | cut -f2- -d">"