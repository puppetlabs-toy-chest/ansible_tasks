#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_read_capacity+x}" ];
  then params="${params} read_capacity=\"${PT_read_capacity}\""
fi

if [ ! -z "${PT_hash_key_name+x}" ];
  then params="${params} hash_key_name=\"${PT_hash_key_name}\""
fi

if [ ! -z "${PT_range_key_type+x}" ];
  then params="${params} range_key_type=\"${PT_range_key_type}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_range_key_name+x}" ];
  then params="${params} range_key_name=\"${PT_range_key_name}\""
fi

if [ ! -z "${PT_wait_for_active_timeout+x}" ];
  then params="${params} wait_for_active_timeout=\"${PT_wait_for_active_timeout}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_write_capacity+x}" ];
  then params="${params} write_capacity=\"${PT_write_capacity}\""
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

if [ ! -z "${PT_indexes+x}" ];
  then params="${params} indexes=\"${PT_indexes}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_hash_key_type+x}" ];
  then params="${params} hash_key_type=\"${PT_hash_key_type}\""
fi

ansible localhost -m dynamodb_table --args "${params}" --one-line | cut -f2- -d">"