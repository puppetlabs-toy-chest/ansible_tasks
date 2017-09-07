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

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_grant_types+x}" ];
  then params="${params} grant_types=\"${PT_grant_types}\""
fi

if [ ! -z "${PT_role_name+x}" ];
  then params="${params} role_name=\"${PT_role_name}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_key_arn+x}" ];
  then params="${params} key_arn=\"${PT_key_arn}\""
fi

if [ ! -z "${PT_clean_invalid_entries+x}" ];
  then params="${params} clean_invalid_entries=\"${PT_clean_invalid_entries}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_key_alias+x}" ];
  then params="${params} key_alias=\"${PT_key_alias}\""
fi

ansible localhost -m aws_kms --args "${params}" --one-line | cut -f2- -d">"