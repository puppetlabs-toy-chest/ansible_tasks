#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_role_arn+x}" ];
  then params="${params} role_arn=\"${PT_role_arn}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_duration_seconds+x}" ];
  then params="${params} duration_seconds=\"${PT_duration_seconds}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_role_session_name+x}" ];
  then params="${params} role_session_name=\"${PT_role_session_name}\""
fi

if [ ! -z "${PT_mfa_token+x}" ];
  then params="${params} mfa_token=\"${PT_mfa_token}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_policy+x}" ];
  then params="${params} policy=\"${PT_policy}\""
fi

if [ ! -z "${PT_external_id+x}" ];
  then params="${params} external_id=\"${PT_external_id}\""
fi

if [ ! -z "${PT_mfa_serial_number+x}" ];
  then params="${params} mfa_serial_number=\"${PT_mfa_serial_number}\""
fi

ansible localhost -m sts_assume_role --args "${params}" --one-line | cut -f2- -d">"