#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_user_key+x}" ];
  then params="${params} user_key=\"${PT_user_key}\""
fi

if [ ! -z "${PT_app_token+x}" ];
  then params="${params} app_token=\"${PT_app_token}\""
fi

if [ ! -z "${PT_pri+x}" ];
  then params="${params} pri=\"${PT_pri}\""
fi

ansible localhost -m pushover --args "${params}" --one-line | cut -f2- -d">"