#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_icmp_echo+x}" ];
  then params="${params} icmp_echo=\"${PT_icmp_echo}\""
fi

if [ ! -z "${PT_auto_delete+x}" ];
  then params="${params} auto_delete=\"${PT_auto_delete}\""
fi

if [ ! -z "${PT_connection_limit+x}" ];
  then params="${params} connection_limit=\"${PT_connection_limit}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_netmask+x}" ];
  then params="${params} netmask=\"${PT_netmask}\""
fi

if [ ! -z "${PT_arp_state+x}" ];
  then params="${params} arp_state=\"${PT_arp_state}\""
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

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_use_route_advertisement+x}" ];
  then params="${params} use_route_advertisement=\"${PT_use_route_advertisement}\""
fi

if [ ! -z "${PT_advertise_route+x}" ];
  then params="${params} advertise_route=\"${PT_advertise_route}\""
fi

ansible localhost -m bigip_virtual_address --args "${params}" --one-line | cut -f2- -d">"