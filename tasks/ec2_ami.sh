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

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_kernel_id+x}" ];
  then params="${params} kernel_id=\"${PT_kernel_id}\""
fi

if [ ! -z "${PT_launch_permissions+x}" ];
  then params="${params} launch_permissions=\"${PT_launch_permissions}\""
fi

if [ ! -z "${PT_image_id+x}" ];
  then params="${params} image_id=\"${PT_image_id}\""
fi

if [ ! -z "${PT_no_reboot+x}" ];
  then params="${params} no_reboot=\"${PT_no_reboot}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_root_device_name+x}" ];
  then params="${params} root_device_name=\"${PT_root_device_name}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_delete_snapshot+x}" ];
  then params="${params} delete_snapshot=\"${PT_delete_snapshot}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_instance_id+x}" ];
  then params="${params} instance_id=\"${PT_instance_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_architecture+x}" ];
  then params="${params} architecture=\"${PT_architecture}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_virtualization_type+x}" ];
  then params="${params} virtualization_type=\"${PT_virtualization_type}\""
fi

if [ ! -z "${PT_device_mapping+x}" ];
  then params="${params} device_mapping=\"${PT_device_mapping}\""
fi

ansible localhost -m ec2_ami --args "${params}" --one-line | cut -f2- -d">"