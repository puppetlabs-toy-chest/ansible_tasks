#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_cluster_parameter_group_name+x}" ];
  then params="${params} cluster_parameter_group_name=\"${PT_cluster_parameter_group_name}\""
fi

if [ ! -z "${PT_new_cluster_identifier+x}" ];
  then params="${params} new_cluster_identifier=\"${PT_new_cluster_identifier}\""
fi

if [ ! -z "${PT_number_of_nodes+x}" ];
  then params="${params} number_of_nodes=\"${PT_number_of_nodes}\""
fi

if [ ! -z "${PT_availability_zone+x}" ];
  then params="${params} availability_zone=\"${PT_availability_zone}\""
fi

if [ ! -z "${PT_encrypted+x}" ];
  then params="${params} encrypted=\"${PT_encrypted}\""
fi

if [ ! -z "${PT_cluster_version+x}" ];
  then params="${params} cluster_version=\"${PT_cluster_version}\""
fi

if [ ! -z "${PT_node_type+x}" ];
  then params="${params} node_type=\"${PT_node_type}\""
fi

if [ ! -z "${PT_db_name+x}" ];
  then params="${params} db_name=\"${PT_db_name}\""
fi

if [ ! -z "${PT_publicly_accessible+x}" ];
  then params="${params} publicly_accessible=\"${PT_publicly_accessible}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
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

if [ ! -z "${PT_allow_version_upgrade+x}" ];
  then params="${params} allow_version_upgrade=\"${PT_allow_version_upgrade}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_cluster_type+x}" ];
  then params="${params} cluster_type=\"${PT_cluster_type}\""
fi

if [ ! -z "${PT_elastic_ip+x}" ];
  then params="${params} elastic_ip=\"${PT_elastic_ip}\""
fi

if [ ! -z "${PT_cluster_subnet_group_name+x}" ];
  then params="${params} cluster_subnet_group_name=\"${PT_cluster_subnet_group_name}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_cluster_security_groups+x}" ];
  then params="${params} cluster_security_groups=\"${PT_cluster_security_groups}\""
fi

if [ ! -z "${PT_automated_snapshot_retention_period+x}" ];
  then params="${params} automated_snapshot_retention_period=\"${PT_automated_snapshot_retention_period}\""
fi

if [ ! -z "${PT_identifier+x}" ];
  then params="${params} identifier=\"${PT_identifier}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_preferred_maintenance_window+x}" ];
  then params="${params} preferred_maintenance_window=\"${PT_preferred_maintenance_window}\""
fi

if [ ! -z "${PT_vpc_security_group_ids+x}" ];
  then params="${params} vpc_security_group_ids=\"${PT_vpc_security_group_ids}\""
fi

ansible localhost -m redshift --args "${params}" --one-line | cut -f2- -d">"