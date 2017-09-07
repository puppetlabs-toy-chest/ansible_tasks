#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_broadcast+x}" ];
  then params="${params} broadcast=\"${PT_broadcast}\""
fi

if [ ! -z "${PT_mac+x}" ];
  then params="${params} mac=\"${PT_mac}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

ansible localhost -m wakeonlan --args "${params}" --one-line | cut -f2- -d">"