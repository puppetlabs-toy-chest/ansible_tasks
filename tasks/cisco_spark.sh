#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_personal_token+x}" ];
  then params="${params} personal_token=\"${PT_personal_token}\""
fi

if [ ! -z "${PT_message+x}" ];
  then params="${params} message=\"${PT_message}\""
fi

if [ ! -z "${PT_recipient_id+x}" ];
  then params="${params} recipient_id=\"${PT_recipient_id}\""
fi

if [ ! -z "${PT_message_type+x}" ];
  then params="${params} message_type=\"${PT_message_type}\""
fi

if [ ! -z "${PT_recipient_type+x}" ];
  then params="${params} recipient_type=\"${PT_recipient_type}\""
fi

ansible localhost -m cisco_spark --args "${params}" --one-line | cut -f2- -d">"