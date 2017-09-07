#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_bidir+x}" ];
  then params="${params} bidir=\"${PT_bidir}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_route_map+x}" ];
  then params="${params} route_map=\"${PT_route_map}\""
fi

if [ ! -z "${PT_rp_address+x}" ];
  then params="${params} rp_address=\"${PT_rp_address}\""
fi

if [ ! -z "${PT_group_list+x}" ];
  then params="${params} group_list=\"${PT_group_list}\""
fi

if [ ! -z "${PT_prefix_list+x}" ];
  then params="${params} prefix_list=\"${PT_prefix_list}\""
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

ansible localhost -m nxos_pim_rp_address --args "${params}" --one-line | cut -f2- -d">"