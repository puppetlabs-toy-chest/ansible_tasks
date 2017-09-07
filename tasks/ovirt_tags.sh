#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_parent+x}" ];
  then params="${params} parent=\"${PT_parent}\""
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

if [ ! -z "${PT_hosts+x}" ];
  then params="${params} hosts=\"${PT_hosts}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_vms+x}" ];
  then params="${params} vms=\"${PT_vms}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

ansible localhost -m ovirt_tags --args "${params}" --one-line | cut -f2- -d">"