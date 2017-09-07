#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_kernel_id+x}" ];
  then params="${params} kernel_id=\"${PT_kernel_id}\""
fi

if [ ! -z "${PT_key_name+x}" ];
  then params="${params} key_name=\"${PT_key_name}\""
fi

if [ ! -z "${PT_ramdisk_id+x}" ];
  then params="${params} ramdisk_id=\"${PT_ramdisk_id}\""
fi

if [ ! -z "${PT_user_data+x}" ];
  then params="${params} user_data=\"${PT_user_data}\""
fi

if [ ! -z "${PT_image_id+x}" ];
  then params="${params} image_id=\"${PT_image_id}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_instance_monitoring+x}" ];
  then params="${params} instance_monitoring=\"${PT_instance_monitoring}\""
fi

if [ ! -z "${PT_classic_link_vpc_id+x}" ];
  then params="${params} classic_link_vpc_id=\"${PT_classic_link_vpc_id}\""
fi

if [ ! -z "${PT_security_groups+x}" ];
  then params="${params} security_groups=\"${PT_security_groups}\""
fi

if [ ! -z "${PT_classic_link_vpc_security_groups+x}" ];
  then params="${params} classic_link_vpc_security_groups=\"${PT_classic_link_vpc_security_groups}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_spot_price+x}" ];
  then params="${params} spot_price=\"${PT_spot_price}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_instance_profile_name+x}" ];
  then params="${params} instance_profile_name=\"${PT_instance_profile_name}\""
fi

if [ ! -z "${PT_user_data_path+x}" ];
  then params="${params} user_data_path=\"${PT_user_data_path}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_ebs_optimized+x}" ];
  then params="${params} ebs_optimized=\"${PT_ebs_optimized}\""
fi

if [ ! -z "${PT_assign_public_ip+x}" ];
  then params="${params} assign_public_ip=\"${PT_assign_public_ip}\""
fi

if [ ! -z "${PT_instance_type+x}" ];
  then params="${params} instance_type=\"${PT_instance_type}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_volumes+x}" ];
  then params="${params} volumes=\"${PT_volumes}\""
fi

if [ ! -z "${PT_vpc_id+x}" ];
  then params="${params} vpc_id=\"${PT_vpc_id}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m ec2_lc --args "${params}" --one-line | cut -f2- -d">"