#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_feature_name+x}" ];
  then params="${params} feature_name=\"${PT_feature_name}\""
fi

if [ ! -z "${PT_interface_type+x}" ];
  then params="${params} interface_type=\"${PT_interface_type}\""
fi

if [ ! -z "${PT_trap_name+x}" ];
  then params="${params} trap_name=\"${PT_trap_name}\""
fi

if [ ! -z "${PT_port_number+x}" ];
  then params="${params} port_number=\"${PT_port_number}\""
fi

if [ ! -z "${PT_interface_number+x}" ];
  then params="${params} interface_number=\"${PT_interface_number}\""
fi

ansible localhost -m ce_snmp_traps --args "${params}" --one-line | cut -f2- -d">"