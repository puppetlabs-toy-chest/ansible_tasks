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

if [ ! -z "${PT_next_hop+x}" ];
  then params="${params} next_hop=\"${PT_next_hop}\""
fi

if [ ! -z "${PT_mask+x}" ];
  then params="${params} mask=\"${PT_mask}\""
fi

if [ ! -z "${PT_prefix+x}" ];
  then params="${params} prefix=\"${PT_prefix}\""
fi

if [ ! -z "${PT_collection+x}" ];
  then params="${params} collection=\"${PT_collection}\""
fi

if [ ! -z "${PT_admin_distance+x}" ];
  then params="${params} admin_distance=\"${PT_admin_distance}\""
fi

ansible localhost -m net_static_route --args "${params}" --one-line | cut -f2- -d">"