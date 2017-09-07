#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_kernel+x}" ];
  then params="${params} kernel=\"${PT_kernel}\""
fi

if [ ! -z "${PT_ramdisk+x}" ];
  then params="${params} ramdisk=\"${PT_ramdisk}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_user_data+x}" ];
  then params="${params} user_data=\"${PT_user_data}\""
fi

if [ ! -z "${PT_termination_protection+x}" ];
  then params="${params} termination_protection=\"${PT_termination_protection}\""
fi

if [ ! -z "${PT_private_ip+x}" ];
  then params="${params} private_ip=\"${PT_private_ip}\""
fi

if [ ! -z "${PT_spot_type+x}" ];
  then params="${params} spot_type=\"${PT_spot_type}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
fi

if [ ! -z "${PT_source_dest_check+x}" ];
  then params="${params} source_dest_check=\"${PT_source_dest_check}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_spot_wait_timeout+x}" ];
  then params="${params} spot_wait_timeout=\"${PT_spot_wait_timeout}\""
fi

if [ ! -z "${PT_monitoring+x}" ];
  then params="${params} monitoring=\"${PT_monitoring}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_exact_count+x}" ];
  then params="${params} exact_count=\"${PT_exact_count}\""
fi

if [ ! -z "${PT_ebs_optimized+x}" ];
  then params="${params} ebs_optimized=\"${PT_ebs_optimized}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_placement_group+x}" ];
  then params="${params} placement_group=\"${PT_placement_group}\""
fi

if [ ! -z "${PT_count_tag+x}" ];
  then params="${params} count_tag=\"${PT_count_tag}\""
fi

if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_key_name+x}" ];
  then params="${params} key_name=\"${PT_key_name}\""
fi

if [ ! -z "${PT_spot_launch_group+x}" ];
  then params="${params} spot_launch_group=\"${PT_spot_launch_group}\""
fi

if [ ! -z "${PT_vpc_subnet_id+x}" ];
  then params="${params} vpc_subnet_id=\"${PT_vpc_subnet_id}\""
fi

if [ ! -z "${PT_instance_ids+x}" ];
  then params="${params} instance_ids=\"${PT_instance_ids}\""
fi

if [ ! -z "${PT_spot_price+x}" ];
  then params="${params} spot_price=\"${PT_spot_price}\""
fi

if [ ! -z "${PT_tenancy+x}" ];
  then params="${params} tenancy=\"${PT_tenancy}\""
fi

if [ ! -z "${PT_assign_public_ip+x}" ];
  then params="${params} assign_public_ip=\"${PT_assign_public_ip}\""
fi

if [ ! -z "${PT_group+x}" ];
  then params="${params} group=\"${PT_group}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_count+x}" ];
  then params="${params} count=\"${PT_count}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_instance_profile_name+x}" ];
  then params="${params} instance_profile_name=\"${PT_instance_profile_name}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_network_interfaces+x}" ];
  then params="${params} network_interfaces=\"${PT_network_interfaces}\""
fi

if [ ! -z "${PT_instance_initiated_shutdown_behavior+x}" ];
  then params="${params} instance_initiated_shutdown_behavior=\"${PT_instance_initiated_shutdown_behavior}\""
fi

if [ ! -z "${PT_instance_type+x}" ];
  then params="${params} instance_type=\"${PT_instance_type}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_volumes+x}" ];
  then params="${params} volumes=\"${PT_volumes}\""
fi

if [ ! -z "${PT_instance_tags+x}" ];
  then params="${params} instance_tags=\"${PT_instance_tags}\""
fi

if [ ! -z "${PT_group_id+x}" ];
  then params="${params} group_id=\"${PT_group_id}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m ec2 --args "${params}" --one-line | cut -f2- -d">"