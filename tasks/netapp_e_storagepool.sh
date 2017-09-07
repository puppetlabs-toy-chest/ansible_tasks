#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_criteria_min_usable_capacity+x}" ];
  then params="${params} criteria_min_usable_capacity=\"${PT_criteria_min_usable_capacity}\""
fi

if [ ! -z "${PT_api_password+x}" ];
  then params="${params} api_password=\"${PT_api_password}\""
fi

if [ ! -z "${PT_criteria_drive_type+x}" ];
  then params="${params} criteria_drive_type=\"${PT_criteria_drive_type}\""
fi

if [ ! -z "${PT_remove_volumes+x}" ];
  then params="${params} remove_volumes=\"${PT_remove_volumes}\""
fi

if [ ! -z "${PT_criteria_drive_min_size+x}" ];
  then params="${params} criteria_drive_min_size=\"${PT_criteria_drive_min_size}\""
fi

if [ ! -z "${PT_api_url+x}" ];
  then params="${params} api_url=\"${PT_api_url}\""
fi

if [ ! -z "${PT_reserve_drive_count+x}" ];
  then params="${params} reserve_drive_count=\"${PT_reserve_drive_count}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_criteria_size_unit+x}" ];
  then params="${params} criteria_size_unit=\"${PT_criteria_size_unit}\""
fi

if [ ! -z "${PT_criteria_drive_require_fde+x}" ];
  then params="${params} criteria_drive_require_fde=\"${PT_criteria_drive_require_fde}\""
fi

if [ ! -z "${PT_criteria_drive_interface_type+x}" ];
  then params="${params} criteria_drive_interface_type=\"${PT_criteria_drive_interface_type}\""
fi

if [ ! -z "${PT_ssid+x}" ];
  then params="${params} ssid=\"${PT_ssid}\""
fi

if [ ! -z "${PT_secure_pool+x}" ];
  then params="${params} secure_pool=\"${PT_secure_pool}\""
fi

if [ ! -z "${PT_raid_level+x}" ];
  then params="${params} raid_level=\"${PT_raid_level}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_criteria_drive_count+x}" ];
  then params="${params} criteria_drive_count=\"${PT_criteria_drive_count}\""
fi

if [ ! -z "${PT_api_username+x}" ];
  then params="${params} api_username=\"${PT_api_username}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_erase_secured_drives+x}" ];
  then params="${params} erase_secured_drives=\"${PT_erase_secured_drives}\""
fi

ansible localhost -m netapp_e_storagepool --args "${params}" --one-line | cut -f2- -d">"