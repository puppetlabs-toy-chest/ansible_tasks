#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_jumbo_max+x}" ];
  then params="${params} jumbo_max=\"${PT_jumbo_max}\""
fi

if [ ! -z "${PT_jumbo_min+x}" ];
  then params="${params} jumbo_min=\"${PT_jumbo_min}\""
fi

if [ ! -z "${PT_mtu+x}" ];
  then params="${params} mtu=\"${PT_mtu}\""
fi

ansible localhost -m ce_mtu --args "${params}" --one-line | cut -f2- -d">"