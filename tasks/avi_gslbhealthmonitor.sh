#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_https_monitor+x}" ];
  then params="${params} https_monitor=\"${PT_https_monitor}\""
fi

if [ ! -z "${PT_receive_timeout+x}" ];
  then params="${params} receive_timeout=\"${PT_receive_timeout}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_udp_monitor+x}" ];
  then params="${params} udp_monitor=\"${PT_udp_monitor}\""
fi

if [ ! -z "${PT_http_monitor+x}" ];
  then params="${params} http_monitor=\"${PT_http_monitor}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_successful_checks+x}" ];
  then params="${params} successful_checks=\"${PT_successful_checks}\""
fi

if [ ! -z "${PT_monitor_port+x}" ];
  then params="${params} monitor_port=\"${PT_monitor_port}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_dns_monitor+x}" ];
  then params="${params} dns_monitor=\"${PT_dns_monitor}\""
fi

if [ ! -z "${PT_tenant_ref+x}" ];
  then params="${params} tenant_ref=\"${PT_tenant_ref}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_failed_checks+x}" ];
  then params="${params} failed_checks=\"${PT_failed_checks}\""
fi

if [ ! -z "${PT_tcp_monitor+x}" ];
  then params="${params} tcp_monitor=\"${PT_tcp_monitor}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_send_interval+x}" ];
  then params="${params} send_interval=\"${PT_send_interval}\""
fi

if [ ! -z "${PT_external_monitor+x}" ];
  then params="${params} external_monitor=\"${PT_external_monitor}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

ansible localhost -m avi_gslbhealthmonitor --args "${params}" --one-line | cut -f2- -d">"