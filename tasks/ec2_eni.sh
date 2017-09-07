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

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_security_groups+x}" ];
  then params="${params} security_groups=\"${PT_security_groups}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_secondary_private_ip_addresses+x}" ];
  then params="${params} secondary_private_ip_addresses=\"${PT_secondary_private_ip_addresses}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_subnet_id+x}" ];
  then params="${params} subnet_id=\"${PT_subnet_id}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_device_index+x}" ];
  then params="${params} device_index=\"${PT_device_index}\""
fi

if [ ! -z "${PT_attached+x}" ];
  then params="${params} attached=\"${PT_attached}\""
fi

if [ ! -z "${PT_force_detach+x}" ];
  then params="${params} force_detach=\"${PT_force_detach}\""
fi

if [ ! -z "${PT_instance_id+x}" ];
  then params="${params} instance_id=\"${PT_instance_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_source_dest_check+x}" ];
  then params="${params} source_dest_check=\"${PT_source_dest_check}\""
fi

if [ ! -z "${PT_private_ip_address+x}" ];
  then params="${params} private_ip_address=\"${PT_private_ip_address}\""
fi

if [ ! -z "${PT_secondary_private_ip_address_count+x}" ];
  then params="${params} secondary_private_ip_address_count=\"${PT_secondary_private_ip_address_count}\""
fi

if [ ! -z "${PT_eni_id+x}" ];
  then params="${params} eni_id=\"${PT_eni_id}\""
fi

if [ ! -z "${PT_delete_on_termination+x}" ];
  then params="${params} delete_on_termination=\"${PT_delete_on_termination}\""
fi

ansible localhost -m ec2_eni --args "${params}" --one-line | cut -f2- -d">"