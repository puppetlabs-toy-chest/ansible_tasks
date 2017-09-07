#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_native_vlan+x}" ];
  then params="${params} native_vlan=\"${PT_native_vlan}\""
fi

if [ ! -z "${PT_access_vlan+x}" ];
  then params="${params} access_vlan=\"${PT_access_vlan}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_trunk_vlans+x}" ];
  then params="${params} trunk_vlans=\"${PT_trunk_vlans}\""
fi

ansible localhost -m ce_switchport --args "${params}" --one-line | cut -f2- -d">"