#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_create_copy_pair_if_does_not_exist+x}" ];
  then params="${params} create_copy_pair_if_does_not_exist=\"${PT_create_copy_pair_if_does_not_exist}\""
fi

if [ ! -z "${PT_search_volume_id+x}" ];
  then params="${params} search_volume_id=\"${PT_search_volume_id}\""
fi

if [ ! -z "${PT_api_url+x}" ];
  then params="${params} api_url=\"${PT_api_url}\""
fi

if [ ! -z "${PT_source_volume_id+x}" ];
  then params="${params} source_volume_id=\"${PT_source_volume_id}\""
fi

if [ ! -z "${PT_api_password+x}" ];
  then params="${params} api_password=\"${PT_api_password}\""
fi

if [ ! -z "${PT_destination_volume_id+x}" ];
  then params="${params} destination_volume_id=\"${PT_destination_volume_id}\""
fi

if [ ! -z "${PT_volume_copy_pair_id+x}" ];
  then params="${params} volume_copy_pair_id=\"${PT_volume_copy_pair_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_api_username+x}" ];
  then params="${params} api_username=\"${PT_api_username}\""
fi

if [ ! -z "${PT_start_stop_copy+x}" ];
  then params="${params} start_stop_copy=\"${PT_start_stop_copy}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m netapp_e_volume_copy --args "${params}" --one-line | cut -f2- -d">"