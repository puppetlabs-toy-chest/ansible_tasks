#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_message_retention_period+x}" ];
  then params="${params} message_retention_period=\"${PT_message_retention_period}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_delivery_delay+x}" ];
  then params="${params} delivery_delay=\"${PT_delivery_delay}\""
fi

if [ ! -z "${PT_receive_message_wait_time+x}" ];
  then params="${params} receive_message_wait_time=\"${PT_receive_message_wait_time}\""
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

if [ ! -z "${PT_default_visibility_timeout+x}" ];
  then params="${params} default_visibility_timeout=\"${PT_default_visibility_timeout}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_maximum_message_size+x}" ];
  then params="${params} maximum_message_size=\"${PT_maximum_message_size}\""
fi

if [ ! -z "${PT_policy+x}" ];
  then params="${params} policy=\"${PT_policy}\""
fi

if [ ! -z "${PT_redrive_policy+x}" ];
  then params="${params} redrive_policy=\"${PT_redrive_policy}\""
fi

ansible localhost -m sqs_queue --args "${params}" --one-line | cut -f2- -d">"