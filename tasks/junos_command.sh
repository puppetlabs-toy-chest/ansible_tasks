#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_retries+x}" ];
  then params="${params} retries=\"${PT_retries}\""
fi

if [ ! -z "${PT_commands+x}" ];
  then params="${params} commands=\"${PT_commands}\""
fi

if [ ! -z "${PT_rpcs+x}" ];
  then params="${params} rpcs=\"${PT_rpcs}\""
fi

if [ ! -z "${PT_interval+x}" ];
  then params="${params} interval=\"${PT_interval}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_wait_for+x}" ];
  then params="${params} wait_for=\"${PT_wait_for}\""
fi

if [ ! -z "${PT_display+x}" ];
  then params="${params} display=\"${PT_display}\""
fi

if [ ! -z "${PT_match+x}" ];
  then params="${params} match=\"${PT_match}\""
fi

ansible localhost -m junos_command --args "${params}" --one-line | cut -f2- -d">"