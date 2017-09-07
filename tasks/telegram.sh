#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_msg_format+x}" ];
  then params="${params} msg_format=\"${PT_msg_format}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_chat_id+x}" ];
  then params="${params} chat_id=\"${PT_chat_id}\""
fi

ansible localhost -m telegram --args "${params}" --one-line | cut -f2- -d">"