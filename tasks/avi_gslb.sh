#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_view_id+x}" ];
  then params="${params} view_id=\"${PT_view_id}\""
fi

if [ ! -z "${PT_third_party_sites+x}" ];
  then params="${params} third_party_sites=\"${PT_third_party_sites}\""
fi

if [ ! -z "${PT_send_interval+x}" ];
  then params="${params} send_interval=\"${PT_send_interval}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_dns_configs+x}" ];
  then params="${params} dns_configs=\"${PT_dns_configs}\""
fi

if [ ! -z "${PT_leader_cluster_uuid+x}" ];
  then params="${params} leader_cluster_uuid=\"${PT_leader_cluster_uuid}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_tenant_ref+x}" ];
  then params="${params} tenant_ref=\"${PT_tenant_ref}\""
fi

if [ ! -z "${PT_sites+x}" ];
  then params="${params} sites=\"${PT_sites}\""
fi

if [ ! -z "${PT_clear_on_max_retries+x}" ];
  then params="${params} clear_on_max_retries=\"${PT_clear_on_max_retries}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_client_ip_addr_group+x}" ];
  then params="${params} client_ip_addr_group=\"${PT_client_ip_addr_group}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

ansible localhost -m avi_gslb --args "${params}" --one-line | cut -f2- -d">"