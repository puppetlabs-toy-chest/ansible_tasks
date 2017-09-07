#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_security_name_v3+x}" ];
  then params="${params} security_name_v3=\"${PT_security_name_v3}\""
fi

if [ ! -z "${PT_recv_port+x}" ];
  then params="${params} recv_port=\"${PT_recv_port}\""
fi

if [ ! -z "${PT_security_model+x}" ];
  then params="${params} security_model=\"${PT_security_model}\""
fi

if [ ! -z "${PT_vpn_name+x}" ];
  then params="${params} vpn_name=\"${PT_vpn_name}\""
fi

if [ ! -z "${PT_address+x}" ];
  then params="${params} address=\"${PT_address}\""
fi

if [ ! -z "${PT_security_name+x}" ];
  then params="${params} security_name=\"${PT_security_name}\""
fi

if [ ! -z "${PT_notify_type+x}" ];
  then params="${params} notify_type=\"${PT_notify_type}\""
fi

if [ ! -z "${PT_connect_port+x}" ];
  then params="${params} connect_port=\"${PT_connect_port}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_host_name+x}" ];
  then params="${params} host_name=\"${PT_host_name}\""
fi

if [ ! -z "${PT_security_level+x}" ];
  then params="${params} security_level=\"${PT_security_level}\""
fi

if [ ! -z "${PT_interface_name+x}" ];
  then params="${params} interface_name=\"${PT_interface_name}\""
fi

if [ ! -z "${PT_is_public_net+x}" ];
  then params="${params} is_public_net=\"${PT_is_public_net}\""
fi

ansible localhost -m ce_snmp_target_host --args "${params}" --one-line | cut -f2- -d">"