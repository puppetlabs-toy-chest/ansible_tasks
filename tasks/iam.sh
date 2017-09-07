#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_new_name+x}" ];
  then params="${params} new_name=\"${PT_new_name}\""
fi

if [ ! -z "${PT_update_password+x}" ];
  then params="${params} update_password=\"${PT_update_password}\""
fi

if [ ! -z "${PT_key_count+x}" ];
  then params="${params} key_count=\"${PT_key_count}\""
fi

if [ ! -z "${PT_access_key_ids+x}" ];
  then params="${params} access_key_ids=\"${PT_access_key_ids}\""
fi

if [ ! -z "${PT_groups+x}" ];
  then params="${params} groups=\"${PT_groups}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_new_path+x}" ];
  then params="${params} new_path=\"${PT_new_path}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_trust_policy_filepath+x}" ];
  then params="${params} trust_policy_filepath=\"${PT_trust_policy_filepath}\""
fi

if [ ! -z "${PT_access_key_state+x}" ];
  then params="${params} access_key_state=\"${PT_access_key_state}\""
fi

if [ ! -z "${PT_iam_type+x}" ];
  then params="${params} iam_type=\"${PT_iam_type}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_trust_policy+x}" ];
  then params="${params} trust_policy=\"${PT_trust_policy}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m iam --args "${params}" --one-line | cut -f2- -d">"