#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_s3_key+x}" ];
  then params="${params} s3_key=\"${PT_s3_key}\""
fi

if [ ! -z "${PT_zip_file+x}" ];
  then params="${params} zip_file=\"${PT_zip_file}\""
fi

if [ ! -z "${PT_s3_object_version+x}" ];
  then params="${params} s3_object_version=\"${PT_s3_object_version}\""
fi

if [ ! -z "${PT_memory_size+x}" ];
  then params="${params} memory_size=\"${PT_memory_size}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_dead_letter_arn+x}" ];
  then params="${params} dead_letter_arn=\"${PT_dead_letter_arn}\""
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

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_handler+x}" ];
  then params="${params} handler=\"${PT_handler}\""
fi

if [ ! -z "${PT_role+x}" ];
  then params="${params} role=\"${PT_role}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_environment_variables+x}" ];
  then params="${params} environment_variables=\"${PT_environment_variables}\""
fi

if [ ! -z "${PT_runtime+x}" ];
  then params="${params} runtime=\"${PT_runtime}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_s3_bucket+x}" ];
  then params="${params} s3_bucket=\"${PT_s3_bucket}\""
fi

if [ ! -z "${PT_vpc_subnet_ids+x}" ];
  then params="${params} vpc_subnet_ids=\"${PT_vpc_subnet_ids}\""
fi

if [ ! -z "${PT_vpc_security_group_ids+x}" ];
  then params="${params} vpc_security_group_ids=\"${PT_vpc_security_group_ids}\""
fi

ansible localhost -m lambda --args "${params}" --one-line | cut -f2- -d">"