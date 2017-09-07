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

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_purge_tags+x}" ];
  then params="${params} purge_tags=\"${PT_purge_tags}\""
fi

if [ ! -z "${PT_idle_timeout+x}" ];
  then params="${params} idle_timeout=\"${PT_idle_timeout}\""
fi

if [ ! -z "${PT_deletion_protection+x}" ];
  then params="${params} deletion_protection=\"${PT_deletion_protection}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_access_logs_s3_prefix+x}" ];
  then params="${params} access_logs_s3_prefix=\"${PT_access_logs_s3_prefix}\""
fi

if [ ! -z "${PT_security_groups+x}" ];
  then params="${params} security_groups=\"${PT_security_groups}\""
fi

if [ ! -z "${PT_access_logs_enabled+x}" ];
  then params="${params} access_logs_enabled=\"${PT_access_logs_enabled}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
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

if [ ! -z "${PT_access_logs_s3_bucket+x}" ];
  then params="${params} access_logs_s3_bucket=\"${PT_access_logs_s3_bucket}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_listeners+x}" ];
  then params="${params} listeners=\"${PT_listeners}\""
fi

if [ ! -z "${PT_scheme+x}" ];
  then params="${params} scheme=\"${PT_scheme}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m elb_application_lb --args "${params}" --one-line | cut -f2- -d">"