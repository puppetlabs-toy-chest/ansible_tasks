#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_http_login_password+x}" ];
  then params="${params} http_login_password=\"${PT_http_login_password}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_http_login_user+x}" ];
  then params="${params} http_login_user=\"${PT_http_login_user}\""
fi

if [ ! -z "${PT_server_url+x}" ];
  then params="${params} server_url=\"${PT_server_url}\""
fi

if [ ! -z "${PT_host_names+x}" ];
  then params="${params} host_names=\"${PT_host_names}\""
fi

if [ ! -z "${PT_host_groups+x}" ];
  then params="${params} host_groups=\"${PT_host_groups}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_collect_data+x}" ];
  then params="${params} collect_data=\"${PT_collect_data}\""
fi

if [ ! -z "${PT_minutes+x}" ];
  then params="${params} minutes=\"${PT_minutes}\""
fi

if [ ! -z "${PT_desc+x}" ];
  then params="${params} desc=\"${PT_desc}\""
fi

ansible localhost -m zabbix_maintenance --args "${params}" --one-line | cut -f2- -d">"