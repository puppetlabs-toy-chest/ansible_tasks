#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_forwarding_rule_name+x}" ];
  then params="${params} forwarding_rule_name=\"${PT_forwarding_rule_name}\""
fi

if [ ! -z "${PT_port_range+x}" ];
  then params="${params} port_range=\"${PT_port_range}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
fi

if [ ! -z "${PT_target+x}" ];
  then params="${params} target=\"${PT_target}\""
fi

if [ ! -z "${PT_address+x}" ];
  then params="${params} address=\"${PT_address}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

ansible localhost -m gcp_forwarding_rule --args "${params}" --one-line | cut -f2- -d">"