#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_style+x}" ];
  then params="${params} style=\"${PT_style}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_passwd+x}" ];
  then params="${params} passwd=\"${PT_passwd}\""
fi

if [ ! -z "${PT_color+x}" ];
  then params="${params} color=\"${PT_color}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_topic+x}" ];
  then params="${params} topic=\"${PT_topic}\""
fi

if [ ! -z "${PT_nick+x}" ];
  then params="${params} nick=\"${PT_nick}\""
fi

if [ ! -z "${PT_part+x}" ];
  then params="${params} part=\"${PT_part}\""
fi

if [ ! -z "${PT_nick_to+x}" ];
  then params="${params} nick_to=\"${PT_nick_to}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_channel+x}" ];
  then params="${params} channel=\"${PT_channel}\""
fi

ansible localhost -m irc --args "${params}" --one-line | cut -f2- -d">"