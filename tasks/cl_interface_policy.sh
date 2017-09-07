#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_allowed+x}" ];
  then params="${params} allowed=\"${PT_allowed}\""
fi

ansible localhost -m cl_interface_policy --args "${params}" --one-line | cut -f2- -d">"