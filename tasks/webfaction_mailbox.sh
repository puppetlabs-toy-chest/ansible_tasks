#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_mailbox_password+x}" ];
  then params="${params} mailbox_password=\"${PT_mailbox_password}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_login_name+x}" ];
  then params="${params} login_name=\"${PT_login_name}\""
fi

if [ ! -z "${PT_mailbox_name+x}" ];
  then params="${params} mailbox_name=\"${PT_mailbox_name}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

ansible localhost -m webfaction_mailbox --args "${params}" --one-line | cut -f2- -d">"