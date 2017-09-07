#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_db_engine+x}" ];
  then params="${params} db_engine=\"${PT_db_engine}\""
fi

if [ ! -z "${PT_iops+x}" ];
  then params="${params} iops=\"${PT_iops}\""
fi

if [ ! -z "${PT_backup_window+x}" ];
  then params="${params} backup_window=\"${PT_backup_window}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_backup_retention+x}" ];
  then params="${params} backup_retention=\"${PT_backup_retention}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_security_groups+x}" ];
  then params="${params} security_groups=\"${PT_security_groups}\""
fi

if [ ! -z "${PT_size+x}" ];
  then params="${params} size=\"${PT_size}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_subnet+x}" ];
  then params="${params} subnet=\"${PT_subnet}\""
fi

if [ ! -z "${PT_vpc_security_groups+x}" ];
  then params="${params} vpc_security_groups=\"${PT_vpc_security_groups}\""
fi

if [ ! -z "${PT_upgrade+x}" ];
  then params="${params} upgrade=\"${PT_upgrade}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_instance_type+x}" ];
  then params="${params} instance_type=\"${PT_instance_type}\""
fi

if [ ! -z "${PT_source_instance+x}" ];
  then params="${params} source_instance=\"${PT_source_instance}\""
fi

if [ ! -z "${PT_parameter_group+x}" ];
  then params="${params} parameter_group=\"${PT_parameter_group}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_multi_zone+x}" ];
  then params="${params} multi_zone=\"${PT_multi_zone}\""
fi

if [ ! -z "${PT_new_instance_name+x}" ];
  then params="${params} new_instance_name=\"${PT_new_instance_name}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_db_name+x}" ];
  then params="${params} db_name=\"${PT_db_name}\""
fi

if [ ! -z "${PT_license_model+x}" ];
  then params="${params} license_model=\"${PT_license_model}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_apply_immediately+x}" ];
  then params="${params} apply_immediately=\"${PT_apply_immediately}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_force_failover+x}" ];
  then params="${params} force_failover=\"${PT_force_failover}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_option_group+x}" ];
  then params="${params} option_group=\"${PT_option_group}\""
fi

if [ ! -z "${PT_engine_version+x}" ];
  then params="${params} engine_version=\"${PT_engine_version}\""
fi

if [ ! -z "${PT_instance_name+x}" ];
  then params="${params} instance_name=\"${PT_instance_name}\""
fi

if [ ! -z "${PT_character_set_name+x}" ];
  then params="${params} character_set_name=\"${PT_character_set_name}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_snapshot+x}" ];
  then params="${params} snapshot=\"${PT_snapshot}\""
fi

if [ ! -z "${PT_publicly_accessible+x}" ];
  then params="${params} publicly_accessible=\"${PT_publicly_accessible}\""
fi

if [ ! -z "${PT_maint_window+x}" ];
  then params="${params} maint_window=\"${PT_maint_window}\""
fi

ansible localhost -m rds --args "${params}" --one-line | cut -f2- -d">"