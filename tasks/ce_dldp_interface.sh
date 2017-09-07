#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_reset+x}" ];
  then params="${params} reset=\"${PT_reset}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_enable+x}" ];
  then params="${params} enable=\"${PT_enable}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_mode_enable+x}" ];
  then params="${params} mode_enable=\"${PT_mode_enable}\""
fi

if [ ! -z "${PT_local_mac+x}" ];
  then params="${params} local_mac=\"${PT_local_mac}\""
fi

ansible localhost -m ce_dldp_interface --args "${params}" --one-line | cut -f2- -d">"