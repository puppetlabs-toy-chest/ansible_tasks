#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_text+x}" ];
  then params="${params} text=\"${PT_text}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_banner+x}" ];
  then params="${params} banner=\"${PT_banner}\""
fi

ansible localhost -m iosxr_banner --args "${params}" --one-line | cut -f2- -d">"