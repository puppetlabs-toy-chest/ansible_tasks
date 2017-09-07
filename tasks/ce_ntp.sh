#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_is_preferred+x}" ];
  then params="${params} is_preferred=\"${PT_is_preferred}\""
fi

if [ ! -z "${PT_peer+x}" ];
  then params="${params} peer=\"${PT_peer}\""
fi

if [ ! -z "${PT_key_id+x}" ];
  then params="${params} key_id=\"${PT_key_id}\""
fi

if [ ! -z "${PT_vpn_name+x}" ];
  then params="${params} vpn_name=\"${PT_vpn_name}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_source_int+x}" ];
  then params="${params} source_int=\"${PT_source_int}\""
fi

ansible localhost -m ce_ntp --args "${params}" --one-line | cut -f2- -d">"