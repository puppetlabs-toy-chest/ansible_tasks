#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_auth_type+x}" ];
  then params="${params} auth_type=\"${PT_auth_type}\""
fi

if [ ! -z "${PT_no_gateway_ip+x}" ];
  then params="${params} no_gateway_ip=\"${PT_no_gateway_ip}\""
fi

if [ ! -z "${PT_region_name+x}" ];
  then params="${params} region_name=\"${PT_region_name}\""
fi

if [ ! -z "${PT_availability_zone+x}" ];
  then params="${params} availability_zone=\"${PT_availability_zone}\""
fi

if [ ! -z "${PT_api_timeout+x}" ];
  then params="${params} api_timeout=\"${PT_api_timeout}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_ipv6_ra_mode+x}" ];
  then params="${params} ipv6_ra_mode=\"${PT_ipv6_ra_mode}\""
fi

if [ ! -z "${PT_endpoint_type+x}" ];
  then params="${params} endpoint_type=\"${PT_endpoint_type}\""
fi

if [ ! -z "${PT_host_routes+x}" ];
  then params="${params} host_routes=\"${PT_host_routes}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_cacert+x}" ];
  then params="${params} cacert=\"${PT_cacert}\""
fi

if [ ! -z "${PT_ipv6_address_mode+x}" ];
  then params="${params} ipv6_address_mode=\"${PT_ipv6_address_mode}\""
fi

if [ ! -z "${PT_cidr+x}" ];
  then params="${params} cidr=\"${PT_cidr}\""
fi

if [ ! -z "${PT_network_name+x}" ];
  then params="${params} network_name=\"${PT_network_name}\""
fi

if [ ! -z "${PT_cloud+x}" ];
  then params="${params} cloud=\"${PT_cloud}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_project+x}" ];
  then params="${params} project=\"${PT_project}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_enable_dhcp+x}" ];
  then params="${params} enable_dhcp=\"${PT_enable_dhcp}\""
fi

if [ ! -z "${PT_dns_nameservers+x}" ];
  then params="${params} dns_nameservers=\"${PT_dns_nameservers}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_use_default_subnetpool+x}" ];
  then params="${params} use_default_subnetpool=\"${PT_use_default_subnetpool}\""
fi

if [ ! -z "${PT_cert+x}" ];
  then params="${params} cert=\"${PT_cert}\""
fi

if [ ! -z "${PT_allocation_pool_start+x}" ];
  then params="${params} allocation_pool_start=\"${PT_allocation_pool_start}\""
fi

if [ ! -z "${PT_gateway_ip+x}" ];
  then params="${params} gateway_ip=\"${PT_gateway_ip}\""
fi

if [ ! -z "${PT_allocation_pool_end+x}" ];
  then params="${params} allocation_pool_end=\"${PT_allocation_pool_end}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_ip_version+x}" ];
  then params="${params} ip_version=\"${PT_ip_version}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m os_subnet --args "${params}" --one-line | cut -f2- -d">"