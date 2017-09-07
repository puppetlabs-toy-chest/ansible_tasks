#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_bridge+x}" ];
  then params="${params} bridge=\"${PT_bridge}\""
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

if [ ! -z "${PT_tag+x}" ];
  then params="${params} tag=\"${PT_tag}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

ansible localhost -m openvswitch_port --args "${params}" --one-line | cut -f2- -d">"