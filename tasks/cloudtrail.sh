#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_kms_key_id+x}" ];
  then params="${params} kms_key_id=\"${PT_kms_key_id}\""
fi

if [ ! -z "${PT_s3_bucket_name+x}" ];
  then params="${params} s3_bucket_name=\"${PT_s3_bucket_name}\""
fi

if [ ! -z "${PT_is_multi_region_trail+x}" ];
  then params="${params} is_multi_region_trail=\"${PT_is_multi_region_trail}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_sns_topic_name+x}" ];
  then params="${params} sns_topic_name=\"${PT_sns_topic_name}\""
fi

if [ ! -z "${PT_s3_key_prefix+x}" ];
  then params="${params} s3_key_prefix=\"${PT_s3_key_prefix}\""
fi

if [ ! -z "${PT_enable_logging+x}" ];
  then params="${params} enable_logging=\"${PT_enable_logging}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_enable_log_file_validation+x}" ];
  then params="${params} enable_log_file_validation=\"${PT_enable_log_file_validation}\""
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

if [ ! -z "${PT_cloudwatch_logs_role_arn+x}" ];
  then params="${params} cloudwatch_logs_role_arn=\"${PT_cloudwatch_logs_role_arn}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_include_global_events+x}" ];
  then params="${params} include_global_events=\"${PT_include_global_events}\""
fi

if [ ! -z "${PT_cloudwatch_logs_log_group_arn+x}" ];
  then params="${params} cloudwatch_logs_log_group_arn=\"${PT_cloudwatch_logs_log_group_arn}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m cloudtrail --args "${params}" --one-line | cut -f2- -d">"