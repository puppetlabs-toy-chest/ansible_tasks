#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_ok_actions+x}" ];
  then params="${params} ok_actions=\"${PT_ok_actions}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_evaluation_periods+x}" ];
  then params="${params} evaluation_periods=\"${PT_evaluation_periods}\""
fi

if [ ! -z "${PT_metric+x}" ];
  then params="${params} metric=\"${PT_metric}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_period+x}" ];
  then params="${params} period=\"${PT_period}\""
fi

if [ ! -z "${PT_statistic+x}" ];
  then params="${params} statistic=\"${PT_statistic}\""
fi

if [ ! -z "${PT_threshold+x}" ];
  then params="${params} threshold=\"${PT_threshold}\""
fi

if [ ! -z "${PT_unit+x}" ];
  then params="${params} unit=\"${PT_unit}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_comparison+x}" ];
  then params="${params} comparison=\"${PT_comparison}\""
fi

if [ ! -z "${PT_alarm_actions+x}" ];
  then params="${params} alarm_actions=\"${PT_alarm_actions}\""
fi

if [ ! -z "${PT_dimensions+x}" ];
  then params="${params} dimensions=\"${PT_dimensions}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_namespace+x}" ];
  then params="${params} namespace=\"${PT_namespace}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_insufficient_data_actions+x}" ];
  then params="${params} insufficient_data_actions=\"${PT_insufficient_data_actions}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m ec2_metric_alarm --args "${params}" --one-line | cut -f2- -d">"