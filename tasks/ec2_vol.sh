#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_encrypted+x}" ];
  then params="${params} encrypted=\"${PT_encrypted}\""
fi

if [ ! -z "${PT_kms_key_id+x}" ];
  then params="${params} kms_key_id=\"${PT_kms_key_id}\""
fi

if [ ! -z "${PT_iops+x}" ];
  then params="${params} iops=\"${PT_iops}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
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

if [ ! -z "${PT_instance+x}" ];
  then params="${params} instance=\"${PT_instance}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_volume_type+x}" ];
  then params="${params} volume_type=\"${PT_volume_type}\""
fi

if [ ! -z "${PT_device_name+x}" ];
  then params="${params} device_name=\"${PT_device_name}\""
fi

if [ ! -z "${PT_volume_size+x}" ];
  then params="${params} volume_size=\"${PT_volume_size}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_snapshot+x}" ];
  then params="${params} snapshot=\"${PT_snapshot}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_delete_on_termination+x}" ];
  then params="${params} delete_on_termination=\"${PT_delete_on_termination}\""
fi

ansible localhost -m ec2_vol --args "${params}" --one-line | cut -f2- -d">"