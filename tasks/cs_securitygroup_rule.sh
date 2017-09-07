#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_icmp_code+x}" ];
  then params="${params} icmp_code=\"${PT_icmp_code}\""
fi

if [ ! -z "${PT_end_port+x}" ];
  then params="${params} end_port=\"${PT_end_port}\""
fi

if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
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

if [ ! -z "${PT_start_port+x}" ];
  then params="${params} start_port=\"${PT_start_port}\""
fi

if [ ! -z "${PT_cidr+x}" ];
  then params="${params} cidr=\"${PT_cidr}\""
fi

if [ ! -z "${PT_icmp_type+x}" ];
  then params="${params} icmp_type=\"${PT_icmp_type}\""
fi

if [ ! -z "${PT_poll_async+x}" ];
  then params="${params} poll_async=\"${PT_poll_async}\""
fi

if [ ! -z "${PT_api_url+x}" ];
  then params="${params} api_url=\"${PT_api_url}\""
fi

if [ ! -z "${PT_user_security_group+x}" ];
  then params="${params} user_security_group=\"${PT_user_security_group}\""
fi

if [ ! -z "${PT_api_region+x}" ];
  then params="${params} api_region=\"${PT_api_region}\""
fi

if [ ! -z "${PT_project+x}" ];
  then params="${params} project=\"${PT_project}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_security_group+x}" ];
  then params="${params} security_group=\"${PT_security_group}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

ansible localhost -m cs_securitygroup_rule --args "${params}" --one-line | cut -f2- -d">"