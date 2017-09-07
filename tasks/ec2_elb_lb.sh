#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_subnets+x}" ];
  then params="${params} subnets=\"${PT_subnets}\""
fi

if [ ! -z "${PT_health_check+x}" ];
  then params="${params} health_check=\"${PT_health_check}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_purge_subnets+x}" ];
  then params="${params} purge_subnets=\"${PT_purge_subnets}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_instance_ids+x}" ];
  then params="${params} instance_ids=\"${PT_instance_ids}\""
fi

if [ ! -z "${PT_zones+x}" ];
  then params="${params} zones=\"${PT_zones}\""
fi

if [ ! -z "${PT_idle_timeout+x}" ];
  then params="${params} idle_timeout=\"${PT_idle_timeout}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_cross_az_load_balancing+x}" ];
  then params="${params} cross_az_load_balancing=\"${PT_cross_az_load_balancing}\""
fi

if [ ! -z "${PT_security_group_ids+x}" ];
  then params="${params} security_group_ids=\"${PT_security_group_ids}\""
fi

if [ ! -z "${PT_purge_zones+x}" ];
  then params="${params} purge_zones=\"${PT_purge_zones}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_purge_instance_ids+x}" ];
  then params="${params} purge_instance_ids=\"${PT_purge_instance_ids}\""
fi

if [ ! -z "${PT_connection_draining_timeout+x}" ];
  then params="${params} connection_draining_timeout=\"${PT_connection_draining_timeout}\""
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

if [ ! -z "${PT_listeners+x}" ];
  then params="${params} listeners=\"${PT_listeners}\""
fi

if [ ! -z "${PT_access_logs+x}" ];
  then params="${params} access_logs=\"${PT_access_logs}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_security_group_names+x}" ];
  then params="${params} security_group_names=\"${PT_security_group_names}\""
fi

if [ ! -z "${PT_purge_listeners+x}" ];
  then params="${params} purge_listeners=\"${PT_purge_listeners}\""
fi

if [ ! -z "${PT_scheme+x}" ];
  then params="${params} scheme=\"${PT_scheme}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_stickiness+x}" ];
  then params="${params} stickiness=\"${PT_stickiness}\""
fi

ansible localhost -m ec2_elb_lb --args "${params}" --one-line | cut -f2- -d">"