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

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_assume_role_policy_document+x}" ];
  then params="${params} assume_role_policy_document=\"${PT_assume_role_policy_document}\""
fi

if [ ! -z "${PT_managed_policy+x}" ];
  then params="${params} managed_policy=\"${PT_managed_policy}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m iam_role --args "${params}" --one-line | cut -f2- -d">"