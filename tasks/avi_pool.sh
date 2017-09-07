#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_lb_algorithm+x}" ];
  then params="${params} lb_algorithm=\"${PT_lb_algorithm}\""
fi

if [ ! -z "${PT_use_service_port+x}" ];
  then params="${params} use_service_port=\"${PT_use_service_port}\""
fi

if [ ! -z "${PT_rewrite_host_header_to_server_name+x}" ];
  then params="${params} rewrite_host_header_to_server_name=\"${PT_rewrite_host_header_to_server_name}\""
fi

if [ ! -z "${PT_host_check_enabled+x}" ];
  then params="${params} host_check_enabled=\"${PT_host_check_enabled}\""
fi

if [ ! -z "${PT_tenant_ref+x}" ];
  then params="${params} tenant_ref=\"${PT_tenant_ref}\""
fi

if [ ! -z "${PT_rewrite_host_header_to_sni+x}" ];
  then params="${params} rewrite_host_header_to_sni=\"${PT_rewrite_host_header_to_sni}\""
fi

if [ ! -z "${PT_capacity_estimation+x}" ];
  then params="${params} capacity_estimation=\"${PT_capacity_estimation}\""
fi

if [ ! -z "${PT_max_conn_rate_per_server+x}" ];
  then params="${params} max_conn_rate_per_server=\"${PT_max_conn_rate_per_server}\""
fi

if [ ! -z "${PT_servers+x}" ];
  then params="${params} servers=\"${PT_servers}\""
fi

if [ ! -z "${PT_fewest_tasks_feedback_delay+x}" ];
  then params="${params} fewest_tasks_feedback_delay=\"${PT_fewest_tasks_feedback_delay}\""
fi

if [ ! -z "${PT_server_auto_scale+x}" ];
  then params="${params} server_auto_scale=\"${PT_server_auto_scale}\""
fi

if [ ! -z "${PT_created_by+x}" ];
  then params="${params} created_by=\"${PT_created_by}\""
fi

if [ ! -z "${PT_ab_pool+x}" ];
  then params="${params} ab_pool=\"${PT_ab_pool}\""
fi

if [ ! -z "${PT_capacity_estimation_ttfb_thresh+x}" ];
  then params="${params} capacity_estimation_ttfb_thresh=\"${PT_capacity_estimation_ttfb_thresh}\""
fi

if [ ! -z "${PT_fail_action+x}" ];
  then params="${params} fail_action=\"${PT_fail_action}\""
fi

if [ ! -z "${PT_placement_networks+x}" ];
  then params="${params} placement_networks=\"${PT_placement_networks}\""
fi

if [ ! -z "${PT_networks+x}" ];
  then params="${params} networks=\"${PT_networks}\""
fi

if [ ! -z "${PT_lb_algorithm_hash+x}" ];
  then params="${params} lb_algorithm_hash=\"${PT_lb_algorithm_hash}\""
fi

if [ ! -z "${PT_sni_enabled+x}" ];
  then params="${params} sni_enabled=\"${PT_sni_enabled}\""
fi

if [ ! -z "${PT_server_name+x}" ];
  then params="${params} server_name=\"${PT_server_name}\""
fi

if [ ! -z "${PT_lb_algorithm_consistent_hash_hdr+x}" ];
  then params="${params} lb_algorithm_consistent_hash_hdr=\"${PT_lb_algorithm_consistent_hash_hdr}\""
fi

if [ ! -z "${PT_cloud_ref+x}" ];
  then params="${params} cloud_ref=\"${PT_cloud_ref}\""
fi

if [ ! -z "${PT_domain_name+x}" ];
  then params="${params} domain_name=\"${PT_domain_name}\""
fi

if [ ! -z "${PT_autoscale_policy_ref+x}" ];
  then params="${params} autoscale_policy_ref=\"${PT_autoscale_policy_ref}\""
fi

if [ ! -z "${PT_ssl_profile_ref+x}" ];
  then params="${params} ssl_profile_ref=\"${PT_ssl_profile_ref}\""
fi

if [ ! -z "${PT_ipaddrgroup_ref+x}" ];
  then params="${params} ipaddrgroup_ref=\"${PT_ipaddrgroup_ref}\""
fi

if [ ! -z "${PT_apic_epg_name+x}" ];
  then params="${params} apic_epg_name=\"${PT_apic_epg_name}\""
fi

if [ ! -z "${PT_server_reselect+x}" ];
  then params="${params} server_reselect=\"${PT_server_reselect}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_nsx_securitygroup+x}" ];
  then params="${params} nsx_securitygroup=\"${PT_nsx_securitygroup}\""
fi

if [ ! -z "${PT_a_pool+x}" ];
  then params="${params} a_pool=\"${PT_a_pool}\""
fi

if [ ! -z "${PT_pki_profile_ref+x}" ];
  then params="${params} pki_profile_ref=\"${PT_pki_profile_ref}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

if [ ! -z "${PT_east_west+x}" ];
  then params="${params} east_west=\"${PT_east_west}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_application_persistence_profile_ref+x}" ];
  then params="${params} application_persistence_profile_ref=\"${PT_application_persistence_profile_ref}\""
fi

if [ ! -z "${PT_inline_health_monitor+x}" ];
  then params="${params} inline_health_monitor=\"${PT_inline_health_monitor}\""
fi

if [ ! -z "${PT_default_server_port+x}" ];
  then params="${params} default_server_port=\"${PT_default_server_port}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_request_queue_depth+x}" ];
  then params="${params} request_queue_depth=\"${PT_request_queue_depth}\""
fi

if [ ! -z "${PT_graceful_disable_timeout+x}" ];
  then params="${params} graceful_disable_timeout=\"${PT_graceful_disable_timeout}\""
fi

if [ ! -z "${PT_ab_priority+x}" ];
  then params="${params} ab_priority=\"${PT_ab_priority}\""
fi

if [ ! -z "${PT_connection_ramp_duration+x}" ];
  then params="${params} connection_ramp_duration=\"${PT_connection_ramp_duration}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_server_count+x}" ];
  then params="${params} server_count=\"${PT_server_count}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_request_queue_enabled+x}" ];
  then params="${params} request_queue_enabled=\"${PT_request_queue_enabled}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_max_concurrent_connections_per_server+x}" ];
  then params="${params} max_concurrent_connections_per_server=\"${PT_max_concurrent_connections_per_server}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_autoscale_launch_config_ref+x}" ];
  then params="${params} autoscale_launch_config_ref=\"${PT_autoscale_launch_config_ref}\""
fi

if [ ! -z "${PT_enabled+x}" ];
  then params="${params} enabled=\"${PT_enabled}\""
fi

if [ ! -z "${PT_autoscale_networks+x}" ];
  then params="${params} autoscale_networks=\"${PT_autoscale_networks}\""
fi

if [ ! -z "${PT_health_monitor_refs+x}" ];
  then params="${params} health_monitor_refs=\"${PT_health_monitor_refs}\""
fi

if [ ! -z "${PT_ssl_key_and_certificate_ref+x}" ];
  then params="${params} ssl_key_and_certificate_ref=\"${PT_ssl_key_and_certificate_ref}\""
fi

if [ ! -z "${PT_cloud_config_cksum+x}" ];
  then params="${params} cloud_config_cksum=\"${PT_cloud_config_cksum}\""
fi

if [ ! -z "${PT_external_autoscale_groups+x}" ];
  then params="${params} external_autoscale_groups=\"${PT_external_autoscale_groups}\""
fi

if [ ! -z "${PT_vrf_ref+x}" ];
  then params="${params} vrf_ref=\"${PT_vrf_ref}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_prst_hdr_name+x}" ];
  then params="${params} prst_hdr_name=\"${PT_prst_hdr_name}\""
fi

ansible localhost -m avi_pool --args "${params}" --one-line | cut -f2- -d">"