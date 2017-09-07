#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_bridge+x}" ];
  then params="${params} bridge=\"${PT_bridge}\""
fi

if [ ! -z "${PT_fail_mode+x}" ];
  then params="${params} fail_mode=\"${PT_fail_mode}\""
fi

if [ ! -z "${PT_parent+x}" ];
  then params="${params} parent=\"${PT_parent}\""
fi

if [ ! -z "${PT_vlan+x}" ];
  then params="${params} vlan=\"${PT_vlan}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_set+x}" ];
  then params="${params} set=\"${PT_set}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_external_ids+x}" ];
  then params="${params} external_ids=\"${PT_external_ids}\""
fi

ansible localhost -m openvswitch_bridge --args "${params}" --one-line | cut -f2- -d">"