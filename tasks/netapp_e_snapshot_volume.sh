#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_snapshot_image_id+x}" ];
  then params="${params} snapshot_image_id=\"${PT_snapshot_image_id}\""
fi

if [ ! -z "${PT_ssid+x}" ];
  then params="${params} ssid=\"${PT_ssid}\""
fi

if [ ! -z "${PT_api_password+x}" ];
  then params="${params} api_password=\"${PT_api_password}\""
fi

if [ ! -z "${PT_repo_percentage+x}" ];
  then params="${params} repo_percentage=\"${PT_repo_percentage}\""
fi

if [ ! -z "${PT_full_threshold+x}" ];
  then params="${params} full_threshold=\"${PT_full_threshold}\""
fi

if [ ! -z "${PT_view_mode+x}" ];
  then params="${params} view_mode=\"${PT_view_mode}\""
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

if [ ! -z "${PT_api_url+x}" ];
  then params="${params} api_url=\"${PT_api_url}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

ansible localhost -m netapp_e_snapshot_volume --args "${params}" --one-line | cut -f2- -d">"