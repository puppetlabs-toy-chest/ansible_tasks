#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_to+x}" ];
  then params="${params} to=\"${PT_to}\""
fi

if [ ! -z "${PT_display_seconds+x}" ];
  then params="${params} display_seconds=\"${PT_display_seconds}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

ansible localhost -m win_msg --args "${params}" --one-line | cut -f2- -d">"