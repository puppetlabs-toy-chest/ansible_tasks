#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_vlan+x}" ];
  then params="${params} vlan=\"${PT_vlan}\""
fi

if [ ! -z "${PT_end_ipv6+x}" ];
  then params="${params} end_ipv6=\"${PT_end_ipv6}\""
fi

if [ ! -z "${PT_api_http_method+x}" ];
  then params="${params} api_http_method=\"${PT_api_http_method}\""
fi

if [ ! -z "${PT_network_domain+x}" ];
  then params="${params} network_domain=\"${PT_network_domain}\""
fi

if [ ! -z "${PT_api_secret+x}" ];
  then params="${params} api_secret=\"${PT_api_secret}\""
fi

if [ ! -z "${PT_api_timeout+x}" ];
  then params="${params} api_timeout=\"${PT_api_timeout}\""
fi

if [ ! -z "${PT_clean_up+x}" ];
  then params="${params} clean_up=\"${PT_clean_up}\""
fi

if [ ! -z "${PT_netmask+x}" ];
  then params="${params} netmask=\"${PT_netmask}\""
fi

if [ ! -z "${PT_network_offering+x}" ];
  then params="${params} network_offering=\"${PT_network_offering}\""
fi

if [ ! -z "${PT_vpc+x}" ];
  then params="${params} vpc=\"${PT_vpc}\""
fi

if [ ! -z "${PT_start_ip+x}" ];
  then params="${params} start_ip=\"${PT_start_ip}\""
fi

if [ ! -z "${PT_gateway+x}" ];
  then params="${params} gateway=\"${PT_gateway}\""
fi

if [ ! -z "${PT_gateway_ipv6+x}" ];
  then params="${params} gateway_ipv6=\"${PT_gateway_ipv6}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_display_text+x}" ];
  then params="${params} display_text=\"${PT_display_text}\""
fi

if [ ! -z "${PT_isolated_pvlan+x}" ];
  then params="${params} isolated_pvlan=\"${PT_isolated_pvlan}\""
fi

if [ ! -z "${PT_account+x}" ];
  then params="${params} account=\"${PT_account}\""
fi

if [ ! -z "${PT_acl_type+x}" ];
  then params="${params} acl_type=\"${PT_acl_type}\""
fi

if [ ! -z "${PT_poll_async+x}" ];
  then params="${params} poll_async=\"${PT_poll_async}\""
fi

if [ ! -z "${PT_api_url+x}" ];
  then params="${params} api_url=\"${PT_api_url}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_api_region+x}" ];
  then params="${params} api_region=\"${PT_api_region}\""
fi

if [ ! -z "${PT_start_ipv6+x}" ];
  then params="${params} start_ipv6=\"${PT_start_ipv6}\""
fi

if [ ! -z "${PT_cidr_ipv6+x}" ];
  then params="${params} cidr_ipv6=\"${PT_cidr_ipv6}\""
fi

if [ ! -z "${PT_project+x}" ];
  then params="${params} project=\"${PT_project}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_end_ip+x}" ];
  then params="${params} end_ip=\"${PT_end_ip}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

ansible localhost -m cs_network --args "${params}" --one-line | cut -f2- -d">"