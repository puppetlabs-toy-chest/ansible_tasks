#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_destination_account_alias+x}" ];
  then params="${params} destination_account_alias=\"${PT_destination_account_alias}\""
fi

if [ ! -z "${PT_destination+x}" ];
  then params="${params} destination=\"${PT_destination}\""
fi

if [ ! -z "${PT_enabled+x}" ];
  then params="${params} enabled=\"${PT_enabled}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_firewall_policy_id+x}" ];
  then params="${params} firewall_policy_id=\"${PT_firewall_policy_id}\""
fi

if [ ! -z "${PT_source_account_alias+x}" ];
  then params="${params} source_account_alias=\"${PT_source_account_alias}\""
fi

if [ ! -z "${PT_ports+x}" ];
  then params="${params} ports=\"${PT_ports}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

ansible localhost -m clc_firewall_policy --args "${params}" --one-line | cut -f2- -d">"