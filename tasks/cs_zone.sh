#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_api_http_method+x}" ];
  then params="${params} api_http_method=\"${PT_api_http_method}\""
fi

if [ ! -z "${PT_api_secret+x}" ];
  then params="${params} api_secret=\"${PT_api_secret}\""
fi

if [ ! -z "${PT_dhcp_provider+x}" ];
  then params="${params} dhcp_provider=\"${PT_dhcp_provider}\""
fi

if [ ! -z "${PT_api_timeout+x}" ];
  then params="${params} api_timeout=\"${PT_api_timeout}\""
fi

if [ ! -z "${PT_guest_cidr_address+x}" ];
  then params="${params} guest_cidr_address=\"${PT_guest_cidr_address}\""
fi

if [ ! -z "${PT_dns2_ipv6+x}" ];
  then params="${params} dns2_ipv6=\"${PT_dns2_ipv6}\""
fi

if [ ! -z "${PT_dns1_ipv6+x}" ];
  then params="${params} dns1_ipv6=\"${PT_dns1_ipv6}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_internal_dns1+x}" ];
  then params="${params} internal_dns1=\"${PT_internal_dns1}\""
fi

if [ ! -z "${PT_internal_dns2+x}" ];
  then params="${params} internal_dns2=\"${PT_internal_dns2}\""
fi

if [ ! -z "${PT_network_domain+x}" ];
  then params="${params} network_domain=\"${PT_network_domain}\""
fi

if [ ! -z "${PT_api_url+x}" ];
  then params="${params} api_url=\"${PT_api_url}\""
fi

if [ ! -z "${PT_dns2+x}" ];
  then params="${params} dns2=\"${PT_dns2}\""
fi

if [ ! -z "${PT_dns1+x}" ];
  then params="${params} dns1=\"${PT_dns1}\""
fi

if [ ! -z "${PT_api_region+x}" ];
  then params="${params} api_region=\"${PT_api_region}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_network_type+x}" ];
  then params="${params} network_type=\"${PT_network_type}\""
fi

ansible localhost -m cs_zone --args "${params}" --one-line | cut -f2- -d">"