#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_cpu_autoscale_policy_id+x}" ];
  then params="${params} cpu_autoscale_policy_id=\"${PT_cpu_autoscale_policy_id}\""
fi

if [ ! -z "${PT_anti_affinity_policy_name+x}" ];
  then params="${params} anti_affinity_policy_name=\"${PT_anti_affinity_policy_name}\""
fi

if [ ! -z "${PT_storage_type+x}" ];
  then params="${params} storage_type=\"${PT_storage_type}\""
fi

if [ ! -z "${PT_anti_affinity_policy_id+x}" ];
  then params="${params} anti_affinity_policy_id=\"${PT_anti_affinity_policy_id}\""
fi

if [ ! -z "${PT_ttl+x}" ];
  then params="${params} ttl=\"${PT_ttl}\""
fi

if [ ! -z "${PT_count_group+x}" ];
  then params="${params} count_group=\"${PT_count_group}\""
fi

if [ ! -z "${PT_secondary_dns+x}" ];
  then params="${params} secondary_dns=\"${PT_secondary_dns}\""
fi

if [ ! -z "${PT_custom_fields+x}" ];
  then params="${params} custom_fields=\"${PT_custom_fields}\""
fi

if [ ! -z "${PT_packages+x}" ];
  then params="${params} packages=\"${PT_packages}\""
fi

if [ ! -z "${PT_group+x}" ];
  then params="${params} group=\"${PT_group}\""
fi

if [ ! -z "${PT_exact_count+x}" ];
  then params="${params} exact_count=\"${PT_exact_count}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_template+x}" ];
  then params="${params} template=\"${PT_template}\""
fi

if [ ! -z "${PT_memory+x}" ];
  then params="${params} memory=\"${PT_memory}\""
fi

if [ ! -z "${PT_server_ids+x}" ];
  then params="${params} server_ids=\"${PT_server_ids}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_managed_os+x}" ];
  then params="${params} managed_os=\"${PT_managed_os}\""
fi

if [ ! -z "${PT_additional_disks+x}" ];
  then params="${params} additional_disks=\"${PT_additional_disks}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_add_public_ip+x}" ];
  then params="${params} add_public_ip=\"${PT_add_public_ip}\""
fi

if [ ! -z "${PT_alert_policy_id+x}" ];
  then params="${params} alert_policy_id=\"${PT_alert_policy_id}\""
fi

if [ ! -z "${PT_alert_policy_name+x}" ];
  then params="${params} alert_policy_name=\"${PT_alert_policy_name}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_ip_address+x}" ];
  then params="${params} ip_address=\"${PT_ip_address}\""
fi

if [ ! -z "${PT_public_ip_protocol+x}" ];
  then params="${params} public_ip_protocol=\"${PT_public_ip_protocol}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_count+x}" ];
  then params="${params} count=\"${PT_count}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_network_id+x}" ];
  then params="${params} network_id=\"${PT_network_id}\""
fi

if [ ! -z "${PT_primary_dns+x}" ];
  then params="${params} primary_dns=\"${PT_primary_dns}\""
fi

if [ ! -z "${PT_alias+x}" ];
  then params="${params} alias=\"${PT_alias}\""
fi

if [ ! -z "${PT_public_ip_ports+x}" ];
  then params="${params} public_ip_ports=\"${PT_public_ip_ports}\""
fi

if [ ! -z "${PT_source_server_password+x}" ];
  then params="${params} source_server_password=\"${PT_source_server_password}\""
fi

if [ ! -z "${PT_os_type+x}" ];
  then params="${params} os_type=\"${PT_os_type}\""
fi

if [ ! -z "${PT_configuration_id+x}" ];
  then params="${params} configuration_id=\"${PT_configuration_id}\""
fi

if [ ! -z "${PT_cpu+x}" ];
  then params="${params} cpu=\"${PT_cpu}\""
fi

ansible localhost -m clc_server --args "${params}" --one-line | cut -f2- -d">"