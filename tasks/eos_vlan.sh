#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_purge+x}" ];
  then params="${params} purge=\"${PT_purge}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_vlan_id+x}" ];
  then params="${params} vlan_id=\"${PT_vlan_id}\""
fi

if [ ! -z "${PT_interfaces+x}" ];
  then params="${params} interfaces=\"${PT_interfaces}\""
fi

if [ ! -z "${PT_collection+x}" ];
  then params="${params} collection=\"${PT_collection}\""
fi

ansible localhost -m eos_vlan --args "${params}" --one-line | cut -f2- -d">"