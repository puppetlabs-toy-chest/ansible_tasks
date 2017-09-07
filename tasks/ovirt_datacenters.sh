#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_compatibility_version+x}" ];
  then params="${params} compatibility_version=\"${PT_compatibility_version}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_mac_pool+x}" ];
  then params="${params} mac_pool=\"${PT_mac_pool}\""
fi

if [ ! -z "${PT_quota_mode+x}" ];
  then params="${params} quota_mode=\"${PT_quota_mode}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
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

if [ ! -z "${PT_fetch_nested+x}" ];
  then params="${params} fetch_nested=\"${PT_fetch_nested}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_local+x}" ];
  then params="${params} local=\"${PT_local}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

ansible localhost -m ovirt_datacenters --args "${params}" --one-line | cut -f2- -d">"