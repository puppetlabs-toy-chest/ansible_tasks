#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_file_change_strategy+x}" ];
  then params="${params} file_change_strategy=\"${PT_file_change_strategy}\""
fi

if [ ! -z "${PT_permission+x}" ];
  then params="${params} permission=\"${PT_permission}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_exclude+x}" ];
  then params="${params} exclude=\"${PT_exclude}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_mime_map+x}" ];
  then params="${params} mime_map=\"${PT_mime_map}\""
fi

if [ ! -z "${PT_file_root+x}" ];
  then params="${params} file_root=\"${PT_file_root}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_bucket+x}" ];
  then params="${params} bucket=\"${PT_bucket}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_include+x}" ];
  then params="${params} include=\"${PT_include}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_key_prefix+x}" ];
  then params="${params} key_prefix=\"${PT_key_prefix}\""
fi

ansible localhost -m s3_sync --args "${params}" --one-line | cut -f2- -d">"