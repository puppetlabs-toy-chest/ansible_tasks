#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_auth_type+x}" ];
  then params="${params} auth_type=\"${PT_auth_type}\""
fi

if [ ! -z "${PT_region_name+x}" ];
  then params="${params} region_name=\"${PT_region_name}\""
fi

if [ ! -z "${PT_allowed_address_pairs+x}" ];
  then params="${params} allowed_address_pairs=\"${PT_allowed_address_pairs}\""
fi

if [ ! -z "${PT_availability_zone+x}" ];
  then params="${params} availability_zone=\"${PT_availability_zone}\""
fi

if [ ! -z "${PT_extra_dhcp_opts+x}" ];
  then params="${params} extra_dhcp_opts=\"${PT_extra_dhcp_opts}\""
fi

if [ ! -z "${PT_api_timeout+x}" ];
  then params="${params} api_timeout=\"${PT_api_timeout}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_device_owner+x}" ];
  then params="${params} device_owner=\"${PT_device_owner}\""
fi

if [ ! -z "${PT_endpoint_type+x}" ];
  then params="${params} endpoint_type=\"${PT_endpoint_type}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_cacert+x}" ];
  then params="${params} cacert=\"${PT_cacert}\""
fi

if [ ! -z "${PT_fixed_ips+x}" ];
  then params="${params} fixed_ips=\"${PT_fixed_ips}\""
fi

if [ ! -z "${PT_cloud+x}" ];
  then params="${params} cloud=\"${PT_cloud}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_network+x}" ];
  then params="${params} network=\"${PT_network}\""
fi

if [ ! -z "${PT_admin_state_up+x}" ];
  then params="${params} admin_state_up=\"${PT_admin_state_up}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_cert+x}" ];
  then params="${params} cert=\"${PT_cert}\""
fi

if [ ! -z "${PT_no_security_groups+x}" ];
  then params="${params} no_security_groups=\"${PT_no_security_groups}\""
fi

if [ ! -z "${PT_security_groups+x}" ];
  then params="${params} security_groups=\"${PT_security_groups}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_mac_address+x}" ];
  then params="${params} mac_address=\"${PT_mac_address}\""
fi

if [ ! -z "${PT_device_id+x}" ];
  then params="${params} device_id=\"${PT_device_id}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m os_port --args "${params}" --one-line | cut -f2- -d">"