#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_guest_vswitch_type+x}" ];
  then params="${params} guest_vswitch_type=\"${PT_guest_vswitch_type}\""
fi

if [ ! -z "${PT_ovm3_cluster+x}" ];
  then params="${params} ovm3_cluster=\"${PT_ovm3_cluster}\""
fi

if [ ! -z "${PT_ovm3_pool+x}" ];
  then params="${params} ovm3_pool=\"${PT_ovm3_pool}\""
fi

if [ ! -z "${PT_api_http_method+x}" ];
  then params="${params} api_http_method=\"${PT_api_http_method}\""
fi

if [ ! -z "${PT_api_secret+x}" ];
  then params="${params} api_secret=\"${PT_api_secret}\""
fi

if [ ! -z "${PT_api_timeout+x}" ];
  then params="${params} api_timeout=\"${PT_api_timeout}\""
fi

if [ ! -z "${PT_vms_ip_address+x}" ];
  then params="${params} vms_ip_address=\"${PT_vms_ip_address}\""
fi

if [ ! -z "${PT_public_vswitch_name+x}" ];
  then params="${params} public_vswitch_name=\"${PT_public_vswitch_name}\""
fi

if [ ! -z "${PT_pod+x}" ];
  then params="${params} pod=\"${PT_pod}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_guest_vswitch_name+x}" ];
  then params="${params} guest_vswitch_name=\"${PT_guest_vswitch_name}\""
fi

if [ ! -z "${PT_vms_username+x}" ];
  then params="${params} vms_username=\"${PT_vms_username}\""
fi

if [ ! -z "${PT_public_vswitch_type+x}" ];
  then params="${params} public_vswitch_type=\"${PT_public_vswitch_type}\""
fi

if [ ! -z "${PT_api_url+x}" ];
  then params="${params} api_url=\"${PT_api_url}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_hypervisor+x}" ];
  then params="${params} hypervisor=\"${PT_hypervisor}\""
fi

if [ ! -z "${PT_ovm3_vip+x}" ];
  then params="${params} ovm3_vip=\"${PT_ovm3_vip}\""
fi

if [ ! -z "${PT_api_region+x}" ];
  then params="${params} api_region=\"${PT_api_region}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_cluster_type+x}" ];
  then params="${params} cluster_type=\"${PT_cluster_type}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_vms_password+x}" ];
  then params="${params} vms_password=\"${PT_vms_password}\""
fi

ansible localhost -m cs_cluster --args "${params}" --one-line | cut -f2- -d">"