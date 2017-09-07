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

if [ ! -z "${PT_policy_document+x}" ];
  then params="${params} policy_document=\"${PT_policy_document}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_iam_name+x}" ];
  then params="${params} iam_name=\"${PT_iam_name}\""
fi

if [ ! -z "${PT_iam_type+x}" ];
  then params="${params} iam_type=\"${PT_iam_type}\""
fi

if [ ! -z "${PT_policy_name+x}" ];
  then params="${params} policy_name=\"${PT_policy_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_policy_json+x}" ];
  then params="${params} policy_json=\"${PT_policy_json}\""
fi

if [ ! -z "${PT_skip_duplicates+x}" ];
  then params="${params} skip_duplicates=\"${PT_skip_duplicates}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m iam_policy --args "${params}" --one-line | cut -f2- -d">"