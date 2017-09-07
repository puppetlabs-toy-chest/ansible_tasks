#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_system_priority+x}" ];
  then params="${params} system_priority=\"${PT_system_priority}\""
fi

if [ ! -z "${PT_role_priority+x}" ];
  then params="${params} role_priority=\"${PT_role_priority}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_auto_recovery+x}" ];
  then params="${params} auto_recovery=\"${PT_auto_recovery}\""
fi

if [ ! -z "${PT_pkl_vrf+x}" ];
  then params="${params} pkl_vrf=\"${PT_pkl_vrf}\""
fi

if [ ! -z "${PT_delay_restore+x}" ];
  then params="${params} delay_restore=\"${PT_delay_restore}\""
fi

if [ ! -z "${PT_peer_gw+x}" ];
  then params="${params} peer_gw=\"${PT_peer_gw}\""
fi

if [ ! -z "${PT_pkl_src+x}" ];
  then params="${params} pkl_src=\"${PT_pkl_src}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

if [ ! -z "${PT_pkl_dest+x}" ];
  then params="${params} pkl_dest=\"${PT_pkl_dest}\""
fi

ansible localhost -m nxos_vpc --args "${params}" --one-line | cut -f2- -d">"