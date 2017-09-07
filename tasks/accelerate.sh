#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_minutes+x}" ];
  then params="${params} minutes=\"${PT_minutes}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_multi_key+x}" ];
  then params="${params} multi_key=\"${PT_multi_key}\""
fi

if [ ! -z "${PT_ipv6+x}" ];
  then params="${params} ipv6=\"${PT_ipv6}\""
fi

ansible localhost -m accelerate --args "${params}" --one-line | cut -f2- -d">"