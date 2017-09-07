#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_monitorid+x}" ];
  then params="${params} monitorid=\"${PT_monitorid}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_apikey+x}" ];
  then params="${params} apikey=\"${PT_apikey}\""
fi

ansible localhost -m uptimerobot --args "${params}" --one-line | cut -f2- -d">"