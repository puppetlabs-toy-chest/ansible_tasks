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

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_group_subnets+x}" ];
  then params="${params} group_subnets=\"${PT_group_subnets}\""
fi

if [ ! -z "${PT_group_description+x}" ];
  then params="${params} group_description=\"${PT_group_description}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_group_name+x}" ];
  then params="${params} group_name=\"${PT_group_name}\""
fi

ansible localhost -m redshift_subnet_group --args "${params}" --one-line | cut -f2- -d">"