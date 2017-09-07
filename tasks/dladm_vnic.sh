#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_temporary+x}" ];
  then params="${params} temporary=\"${PT_temporary}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_link+x}" ];
  then params="${params} link=\"${PT_link}\""
fi

if [ ! -z "${PT_vlan+x}" ];
  then params="${params} vlan=\"${PT_vlan}\""
fi

if [ ! -z "${PT_mac+x}" ];
  then params="${params} mac=\"${PT_mac}\""
fi

ansible localhost -m dladm_vnic --args "${params}" --one-line | cut -f2- -d">"