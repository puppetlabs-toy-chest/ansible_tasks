#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_reload+x}" ];
  then params="${params} reload=\"${PT_reload}\""
fi

if [ ! -z "${PT_setype+x}" ];
  then params="${params} setype=\"${PT_setype}\""
fi

if [ ! -z "${PT_proto+x}" ];
  then params="${params} proto=\"${PT_proto}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_ports+x}" ];
  then params="${params} ports=\"${PT_ports}\""
fi

ansible localhost -m seport --args "${params}" --one-line | cut -f2- -d">"