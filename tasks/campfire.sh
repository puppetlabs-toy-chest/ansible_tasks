#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_subscription+x}" ];
  then params="${params} subscription=\"${PT_subscription}\""
fi

if [ ! -z "${PT_notify+x}" ];
  then params="${params} notify=\"${PT_notify}\""
fi

if [ ! -z "${PT_room+x}" ];
  then params="${params} room=\"${PT_room}\""
fi

ansible localhost -m campfire --args "${params}" --one-line | cut -f2- -d">"