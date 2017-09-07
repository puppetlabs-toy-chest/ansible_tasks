#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_vlan+x}" ];
  then params="${params} vlan=\"${PT_vlan}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_allow_service+x}" ];
  then params="${params} allow_service=\"${PT_allow_service}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_netmask+x}" ];
  then params="${params} netmask=\"${PT_netmask}\""
fi

if [ ! -z "${PT_route_domain+x}" ];
  then params="${params} route_domain=\"${PT_route_domain}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_server_port+x}" ];
  then params="${params} server_port=\"${PT_server_port}\""
fi

if [ ! -z "${PT_address+x}" ];
  then params="${params} address=\"${PT_address}\""
fi

if [ ! -z "${PT_traffic_group+x}" ];
  then params="${params} traffic_group=\"${PT_traffic_group}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m bigip_selfip --args "${params}" --one-line | cut -f2- -d">"