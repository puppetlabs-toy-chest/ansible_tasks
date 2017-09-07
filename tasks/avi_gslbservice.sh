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

if [ ! -z "${PT_wildcard_match+x}" ];
  then params="${params} wildcard_match=\"${PT_wildcard_match}\""
fi

if [ ! -z "${PT_enabled+x}" ];
  then params="${params} enabled=\"${PT_enabled}\""
fi

if [ ! -z "${PT_domain_names+x}" ];
  then params="${params} domain_names=\"${PT_domain_names}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_groups+x}" ];
  then params="${params} groups=\"${PT_groups}\""
fi

if [ ! -z "${PT_ttl+x}" ];
  then params="${params} ttl=\"${PT_ttl}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_health_monitor_scope+x}" ];
  then params="${params} health_monitor_scope=\"${PT_health_monitor_scope}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_controller_health_status_enabled+x}" ];
  then params="${params} controller_health_status_enabled=\"${PT_controller_health_status_enabled}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_down_response+x}" ];
  then params="${params} down_response=\"${PT_down_response}\""
fi

if [ ! -z "${PT_tenant_ref+x}" ];
  then params="${params} tenant_ref=\"${PT_tenant_ref}\""
fi

if [ ! -z "${PT_use_edns_client_subnet+x}" ];
  then params="${params} use_edns_client_subnet=\"${PT_use_edns_client_subnet}\""
fi

if [ ! -z "${PT_created_by+x}" ];
  then params="${params} created_by=\"${PT_created_by}\""
fi

if [ ! -z "${PT_health_monitor_refs+x}" ];
  then params="${params} health_monitor_refs=\"${PT_health_monitor_refs}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_num_dns_ip+x}" ];
  then params="${params} num_dns_ip=\"${PT_num_dns_ip}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

ansible localhost -m avi_gslbservice --args "${params}" --one-line | cut -f2- -d">"