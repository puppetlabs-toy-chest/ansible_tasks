#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_alert_policy_id+x}" ];
  then params="${params} alert_policy_id=\"${PT_alert_policy_id}\""
fi

if [ ! -z "${PT_anti_affinity_policy_name+x}" ];
  then params="${params} anti_affinity_policy_name=\"${PT_anti_affinity_policy_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_anti_affinity_policy_id+x}" ];
  then params="${params} anti_affinity_policy_id=\"${PT_anti_affinity_policy_id}\""
fi

if [ ! -z "${PT_alert_policy_name+x}" ];
  then params="${params} alert_policy_name=\"${PT_alert_policy_name}\""
fi

if [ ! -z "${PT_memory+x}" ];
  then params="${params} memory=\"${PT_memory}\""
fi

if [ ! -z "${PT_server_ids+x}" ];
  then params="${params} server_ids=\"${PT_server_ids}\""
fi

if [ ! -z "${PT_cpu+x}" ];
  then params="${params} cpu=\"${PT_cpu}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

ansible localhost -m clc_modify_server --args "${params}" --one-line | cut -f2- -d">"