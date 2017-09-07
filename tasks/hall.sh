#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_room_token+x}" ];
  then params="${params} room_token=\"${PT_room_token}\""
fi

if [ ! -z "${PT_title+x}" ];
  then params="${params} title=\"${PT_title}\""
fi

if [ ! -z "${PT_picture+x}" ];
  then params="${params} picture=\"${PT_picture}\""
fi

ansible localhost -m hall --args "${params}" --one-line | cut -f2- -d">"