#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_policy_type+x}" ];
  then params="${params} policy_type=\"${PT_policy_type}\""
fi

if [ ! -z "${PT_scaling_group+x}" ];
  then params="${params} scaling_group=\"${PT_scaling_group}\""
fi

if [ ! -z "${PT_cron+x}" ];
  then params="${params} cron=\"${PT_cron}\""
fi

if [ ! -z "${PT_verify_ssl+x}" ];
  then params="${params} verify_ssl=\"${PT_verify_ssl}\""
fi

if [ ! -z "${PT_cooldown+x}" ];
  then params="${params} cooldown=\"${PT_cooldown}\""
fi

if [ ! -z "${PT_at+x}" ];
  then params="${params} at=\"${PT_at}\""
fi

if [ ! -z "${PT_credentials+x}" ];
  then params="${params} credentials=\"${PT_credentials}\""
fi

if [ ! -z "${PT_change+x}" ];
  then params="${params} change=\"${PT_change}\""
fi

if [ ! -z "${PT_is_percent+x}" ];
  then params="${params} is_percent=\"${PT_is_percent}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_desired_capacity+x}" ];
  then params="${params} desired_capacity=\"${PT_desired_capacity}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_env+x}" ];
  then params="${params} env=\"${PT_env}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

ansible localhost -m rax_scaling_policy --args "${params}" --one-line | cut -f2- -d">"