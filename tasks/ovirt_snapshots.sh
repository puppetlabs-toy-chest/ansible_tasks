#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_vm_name+x}" ];
  then params="${params} vm_name=\"${PT_vm_name}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_use_memory+x}" ];
  then params="${params} use_memory=\"${PT_use_memory}\""
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

if [ ! -z "${PT_snapshot_id+x}" ];
  then params="${params} snapshot_id=\"${PT_snapshot_id}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

ansible localhost -m ovirt_snapshots --args "${params}" --one-line | cut -f2- -d">"