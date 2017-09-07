#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_object_id+x}" ];
  then params="${params} object_id=\"${PT_object_id}\""
fi

if [ ! -z "${PT_authz_name+x}" ];
  then params="${params} authz_name=\"${PT_authz_name}\""
fi

if [ ! -z "${PT_object_type+x}" ];
  then params="${params} object_type=\"${PT_object_type}\""
fi

if [ ! -z "${PT_poll_interval+x}" ];
  then params="${params} poll_interval=\"${PT_poll_interval}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_nested_attributes+x}" ];
  then params="${params} nested_attributes=\"${PT_nested_attributes}\""
fi

if [ ! -z "${PT_group_name+x}" ];
  then params="${params} group_name=\"${PT_group_name}\""
fi

if [ ! -z "${PT_object_name+x}" ];
  then params="${params} object_name=\"${PT_object_name}\""
fi

if [ ! -z "${PT_fetch_nested+x}" ];
  then params="${params} fetch_nested=\"${PT_fetch_nested}\""
fi

if [ ! -z "${PT_role+x}" ];
  then params="${params} role=\"${PT_role}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_namespace+x}" ];
  then params="${params} namespace=\"${PT_namespace}\""
fi

if [ ! -z "${PT_user_name+x}" ];
  then params="${params} user_name=\"${PT_user_name}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

ansible localhost -m ovirt_permissions --args "${params}" --one-line | cut -f2- -d">"