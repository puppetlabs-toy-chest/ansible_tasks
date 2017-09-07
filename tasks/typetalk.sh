#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_topic+x}" ];
  then params="${params} topic=\"${PT_topic}\""
fi

if [ ! -z "${PT_client_secret+x}" ];
  then params="${params} client_secret=\"${PT_client_secret}\""
fi

if [ ! -z "${PT_client_id+x}" ];
  then params="${params} client_id=\"${PT_client_id}\""
fi

if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

ansible localhost -m typetalk --args "${params}" --one-line | cut -f2- -d">"