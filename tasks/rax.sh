#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_files+x}" ];
  then params="${params} files=\"${PT_files}\""
fi

if [ ! -z "${PT_tenant_name+x}" ];
  then params="${params} tenant_name=\"${PT_tenant_name}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_user_data+x}" ];
  then params="${params} user_data=\"${PT_user_data}\""
fi

if [ ! -z "${PT_verify_ssl+x}" ];
  then params="${params} verify_ssl=\"${PT_verify_ssl}\""
fi

if [ ! -z "${PT_meta+x}" ];
  then params="${params} meta=\"${PT_meta}\""
fi

if [ ! -z "${PT_boot_volume_terminate+x}" ];
  then params="${params} boot_volume_terminate=\"${PT_boot_volume_terminate}\""
fi

if [ ! -z "${PT_flavor+x}" ];
  then params="${params} flavor=\"${PT_flavor}\""
fi

if [ ! -z "${PT_networks+x}" ];
  then params="${params} networks=\"${PT_networks}\""
fi

if [ ! -z "${PT_auth_endpoint+x}" ];
  then params="${params} auth_endpoint=\"${PT_auth_endpoint}\""
fi

if [ ! -z "${PT_boot_from_volume+x}" ];
  then params="${params} boot_from_volume=\"${PT_boot_from_volume}\""
fi

if [ ! -z "${PT_group+x}" ];
  then params="${params} group=\"${PT_group}\""
fi

if [ ! -z "${PT_exact_count+x}" ];
  then params="${params} exact_count=\"${PT_exact_count}\""
fi

if [ ! -z "${PT_disk_config+x}" ];
  then params="${params} disk_config=\"${PT_disk_config}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_env+x}" ];
  then params="${params} env=\"${PT_env}\""
fi

if [ ! -z "${PT_key_name+x}" ];
  then params="${params} key_name=\"${PT_key_name}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_config_drive+x}" ];
  then params="${params} config_drive=\"${PT_config_drive}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_auto_increment+x}" ];
  then params="${params} auto_increment=\"${PT_auto_increment}\""
fi

if [ ! -z "${PT_count_offset+x}" ];
  then params="${params} count_offset=\"${PT_count_offset}\""
fi

if [ ! -z "${PT_boot_volume+x}" ];
  then params="${params} boot_volume=\"${PT_boot_volume}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_instance_ids+x}" ];
  then params="${params} instance_ids=\"${PT_instance_ids}\""
fi

if [ ! -z "${PT_credentials+x}" ];
  then params="${params} credentials=\"${PT_credentials}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_count+x}" ];
  then params="${params} count=\"${PT_count}\""
fi

if [ ! -z "${PT_boot_volume_size+x}" ];
  then params="${params} boot_volume_size=\"${PT_boot_volume_size}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_identity_type+x}" ];
  then params="${params} identity_type=\"${PT_identity_type}\""
fi

if [ ! -z "${PT_tenant_id+x}" ];
  then params="${params} tenant_id=\"${PT_tenant_id}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_extra_client_args+x}" ];
  then params="${params} extra_client_args=\"${PT_extra_client_args}\""
fi

if [ ! -z "${PT_extra_create_args+x}" ];
  then params="${params} extra_create_args=\"${PT_extra_create_args}\""
fi

ansible localhost -m rax --args "${params}" --one-line | cut -f2- -d">"