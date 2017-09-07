#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_purge_tags+x}" ];
  then params="${params} purge_tags=\"${PT_purge_tags}\""
fi

if [ ! -z "${PT_health_check_port+x}" ];
  then params="${params} health_check_port=\"${PT_health_check_port}\""
fi

if [ ! -z "${PT_successful_response_codes+x}" ];
  then params="${params} successful_response_codes=\"${PT_successful_response_codes}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_stickiness_type+x}" ];
  then params="${params} stickiness_type=\"${PT_stickiness_type}\""
fi

if [ ! -z "${PT_modify_targets+x}" ];
  then params="${params} modify_targets=\"${PT_modify_targets}\""
fi

if [ ! -z "${PT_healthy_threshold_count+x}" ];
  then params="${params} healthy_threshold_count=\"${PT_healthy_threshold_count}\""
fi

if [ ! -z "${PT_targets+x}" ];
  then params="${params} targets=\"${PT_targets}\""
fi

if [ ! -z "${PT_health_check_path+x}" ];
  then params="${params} health_check_path=\"${PT_health_check_path}\""
fi

if [ ! -z "${PT_health_check_protocol+x}" ];
  then params="${params} health_check_protocol=\"${PT_health_check_protocol}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_unhealthy_threshold_count+x}" ];
  then params="${params} unhealthy_threshold_count=\"${PT_unhealthy_threshold_count}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_health_check_interval+x}" ];
  then params="${params} health_check_interval=\"${PT_health_check_interval}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_stickiness_lb_cookie_duration+x}" ];
  then params="${params} stickiness_lb_cookie_duration=\"${PT_stickiness_lb_cookie_duration}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_stickiness_enabled+x}" ];
  then params="${params} stickiness_enabled=\"${PT_stickiness_enabled}\""
fi

if [ ! -z "${PT_vpc_id+x}" ];
  then params="${params} vpc_id=\"${PT_vpc_id}\""
fi

if [ ! -z "${PT_deregistration_delay_timeout+x}" ];
  then params="${params} deregistration_delay_timeout=\"${PT_deregistration_delay_timeout}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_health_check_timeout+x}" ];
  then params="${params} health_check_timeout=\"${PT_health_check_timeout}\""
fi

ansible localhost -m elb_target_group --args "${params}" --one-line | cut -f2- -d">"