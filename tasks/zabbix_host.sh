#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_status+x}" ];
  then params="${params} status=\"${PT_status}\""
fi

if [ ! -z "${PT_inventory_mode+x}" ];
  then params="${params} inventory_mode=\"${PT_inventory_mode}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_interfaces+x}" ];
  then params="${params} interfaces=\"${PT_interfaces}\""
fi

if [ ! -z "${PT_server_url+x}" ];
  then params="${params} server_url=\"${PT_server_url}\""
fi

if [ ! -z "${PT_proxy+x}" ];
  then params="${params} proxy=\"${PT_proxy}\""
fi

if [ ! -z "${PT_host_groups+x}" ];
  then params="${params} host_groups=\"${PT_host_groups}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_http_login_password+x}" ];
  then params="${params} http_login_password=\"${PT_http_login_password}\""
fi

if [ ! -z "${PT_http_login_user+x}" ];
  then params="${params} http_login_user=\"${PT_http_login_user}\""
fi

if [ ! -z "${PT_visible_name+x}" ];
  then params="${params} visible_name=\"${PT_visible_name}\""
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

if [ ! -z "${PT_link_templates+x}" ];
  then params="${params} link_templates=\"${PT_link_templates}\""
fi

ansible localhost -m zabbix_host --args "${params}" --one-line | cut -f2- -d">"