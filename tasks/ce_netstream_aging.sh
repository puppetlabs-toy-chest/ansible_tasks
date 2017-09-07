#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_timeout_type+x}" ];
  then params="${params} timeout_type=\"${PT_timeout_type}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_manual_slot+x}" ];
  then params="${params} manual_slot=\"${PT_manual_slot}\""
fi

if [ ! -z "${PT_timeout_interval+x}" ];
  then params="${params} timeout_interval=\"${PT_timeout_interval}\""
fi

ansible localhost -m ce_netstream_aging --args "${params}" --one-line | cut -f2- -d">"