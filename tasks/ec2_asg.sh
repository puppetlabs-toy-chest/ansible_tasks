#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_target_group_arns+x}" ];
  then params="${params} target_group_arns=\"${PT_target_group_arns}\""
fi

if [ ! -z "${PT_default_cooldown+x}" ];
  then params="${params} default_cooldown=\"${PT_default_cooldown}\""
fi

if [ ! -z "${PT_health_check_period+x}" ];
  then params="${params} health_check_period=\"${PT_health_check_period}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_lc_check+x}" ];
  then params="${params} lc_check=\"${PT_lc_check}\""
fi

if [ ! -z "${PT_availability_zones+x}" ];
  then params="${params} availability_zones=\"${PT_availability_zones}\""
fi

if [ ! -z "${PT_replace_batch_size+x}" ];
  then params="${params} replace_batch_size=\"${PT_replace_batch_size}\""
fi

if [ ! -z "${PT_vpc_zone_identifier+x}" ];
  then params="${params} vpc_zone_identifier=\"${PT_vpc_zone_identifier}\""
fi

if [ ! -z "${PT_suspend_processes+x}" ];
  then params="${params} suspend_processes=\"${PT_suspend_processes}\""
fi

if [ ! -z "${PT_replace_instances+x}" ];
  then params="${params} replace_instances=\"${PT_replace_instances}\""
fi

if [ ! -z "${PT_desired_capacity+x}" ];
  then params="${params} desired_capacity=\"${PT_desired_capacity}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_max_size+x}" ];
  then params="${params} max_size=\"${PT_max_size}\""
fi

if [ ! -z "${PT_placement_group+x}" ];
  then params="${params} placement_group=\"${PT_placement_group}\""
fi

if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_min_size+x}" ];
  then params="${params} min_size=\"${PT_min_size}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_load_balancers+x}" ];
  then params="${params} load_balancers=\"${PT_load_balancers}\""
fi

if [ ! -z "${PT_launch_config_name+x}" ];
  then params="${params} launch_config_name=\"${PT_launch_config_name}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_replace_all_instances+x}" ];
  then params="${params} replace_all_instances=\"${PT_replace_all_instances}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_termination_policies+x}" ];
  then params="${params} termination_policies=\"${PT_termination_policies}\""
fi

if [ ! -z "${PT_health_check_type+x}" ];
  then params="${params} health_check_type=\"${PT_health_check_type}\""
fi

if [ ! -z "${PT_notification_topic+x}" ];
  then params="${params} notification_topic=\"${PT_notification_topic}\""
fi

if [ ! -z "${PT_notification_types+x}" ];
  then params="${params} notification_types=\"${PT_notification_types}\""
fi

if [ ! -z "${PT_wait_for_instances+x}" ];
  then params="${params} wait_for_instances=\"${PT_wait_for_instances}\""
fi

ansible localhost -m ec2_asg --args "${params}" --one-line | cut -f2- -d">"