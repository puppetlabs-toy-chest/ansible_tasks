#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_http_login_password+x}" ];
  then params="${params} http_login_password=\"${PT_http_login_password}\""
fi

if [ ! -z "${PT_macro_name+x}" ];
  then params="${params} macro_name=\"${PT_macro_name}\""
fi

if [ ! -z "${PT_macro_value+x}" ];
  then params="${params} macro_value=\"${PT_macro_value}\""
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

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_host_name+x}" ];
  then params="${params} host_name=\"${PT_host_name}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

ansible localhost -m zabbix_hostmacro --args "${params}" --one-line | cut -f2- -d">"