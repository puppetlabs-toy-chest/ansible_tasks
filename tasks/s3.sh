#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_permission+x}" ];
  then params="${params} permission=\"${PT_permission}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_max_keys+x}" ];
  then params="${params} max_keys=\"${PT_max_keys}\""
fi

if [ ! -z "${PT_object+x}" ];
  then params="${params} object=\"${PT_object}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_prefix+x}" ];
  then params="${params} prefix=\"${PT_prefix}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_marker+x}" ];
  then params="${params} marker=\"${PT_marker}\""
fi

if [ ! -z "${PT_ignore_nonexistent_bucket+x}" ];
  then params="${params} ignore_nonexistent_bucket=\"${PT_ignore_nonexistent_bucket}\""
fi

if [ ! -z "${PT_overwrite+x}" ];
  then params="${params} overwrite=\"${PT_overwrite}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_encrypt+x}" ];
  then params="${params} encrypt=\"${PT_encrypt}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_rgw+x}" ];
  then params="${params} rgw=\"${PT_rgw}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_bucket+x}" ];
  then params="${params} bucket=\"${PT_bucket}\""
fi

if [ ! -z "${PT_retries+x}" ];
  then params="${params} retries=\"${PT_retries}\""
fi

if [ ! -z "${PT_headers+x}" ];
  then params="${params} headers=\"${PT_headers}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_expiration+x}" ];
  then params="${params} expiration=\"${PT_expiration}\""
fi

if [ ! -z "${PT_s3_url+x}" ];
  then params="${params} s3_url=\"${PT_s3_url}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_metadata+x}" ];
  then params="${params} metadata=\"${PT_metadata}\""
fi

ansible localhost -m s3 --args "${params}" --one-line | cut -f2- -d">"