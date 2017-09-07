#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_body+x}" ];
  then params="${params} body=\"${PT_body}\""
fi

if [ ! -z "${PT_title+x}" ];
  then params="${params} title=\"${PT_title}\""
fi

if [ ! -z "${PT_device+x}" ];
  then params="${params} device=\"${PT_device}\""
fi

if [ ! -z "${PT_push_type+x}" ];
  then params="${params} push_type=\"${PT_push_type}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_channel+x}" ];
  then params="${params} channel=\"${PT_channel}\""
fi

ansible localhost -m pushbullet --args "${params}" --one-line | cut -f2- -d">"