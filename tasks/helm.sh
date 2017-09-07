#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_disable_hooks+x}" ];
  then params="${params} disable_hooks=\"${PT_disable_hooks}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_namespace+x}" ];
  then params="${params} namespace=\"${PT_namespace}\""
fi

if [ ! -z "${PT_chart+x}" ];
  then params="${params} chart=\"${PT_chart}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_values+x}" ];
  then params="${params} values=\"${PT_values}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

ansible localhost -m helm --args "${params}" --one-line | cut -f2- -d">"