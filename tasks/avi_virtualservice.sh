#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_client_auth+x}" ];
  then params="${params} client_auth=\"${PT_client_auth}\""
fi

if [ ! -z "${PT_port_uuid+x}" ];
  then params="${params} port_uuid=\"${PT_port_uuid}\""
fi

if [ ! -z "${PT_availability_zone+x}" ];
  then params="${params} availability_zone=\"${PT_availability_zone}\""
fi

if [ ! -z "${PT_flow_dist+x}" ];
  then params="${params} flow_dist=\"${PT_flow_dist}\""
fi

if [ ! -z "${PT_floating_subnet_uuid+x}" ];
  then params="${params} floating_subnet_uuid=\"${PT_floating_subnet_uuid}\""
fi

if [ ! -z "${PT_delay_fairness+x}" ];
  then params="${params} delay_fairness=\"${PT_delay_fairness}\""
fi

if [ ! -z "${PT_vip+x}" ];
  then params="${params} vip=\"${PT_vip}\""
fi

if [ ! -z "${PT_snat_ip+x}" ];
  then params="${params} snat_ip=\"${PT_snat_ip}\""
fi

if [ ! -z "${PT_enable_rhi_snat+x}" ];
  then params="${params} enable_rhi_snat=\"${PT_enable_rhi_snat}\""
fi

if [ ! -z "${PT_sideband_profile+x}" ];
  then params="${params} sideband_profile=\"${PT_sideband_profile}\""
fi

if [ ! -z "${PT_requests_rate_limit+x}" ];
  then params="${params} requests_rate_limit=\"${PT_requests_rate_limit}\""
fi

if [ ! -z "${PT_analytics_profile_ref+x}" ];
  then params="${params} analytics_profile_ref=\"${PT_analytics_profile_ref}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_discovered_subnet+x}" ];
  then params="${params} discovered_subnet=\"${PT_discovered_subnet}\""
fi

if [ ! -z "${PT_pool_ref+x}" ];
  then params="${params} pool_ref=\"${PT_pool_ref}\""
fi

if [ ! -z "${PT_ssl_profile_ref+x}" ];
  then params="${params} ssl_profile_ref=\"${PT_ssl_profile_ref}\""
fi

if [ ! -z "${PT_created_by+x}" ];
  then params="${params} created_by=\"${PT_created_by}\""
fi

if [ ! -z "${PT_ign_pool_net_reach+x}" ];
  then params="${params} ign_pool_net_reach=\"${PT_ign_pool_net_reach}\""
fi

if [ ! -z "${PT_max_cps_per_client+x}" ];
  then params="${params} max_cps_per_client=\"${PT_max_cps_per_client}\""
fi

if [ ! -z "${PT_ssl_sess_cache_avg_size+x}" ];
  then params="${params} ssl_sess_cache_avg_size=\"${PT_ssl_sess_cache_avg_size}\""
fi

if [ ! -z "${PT_vs_datascripts+x}" ];
  then params="${params} vs_datascripts=\"${PT_vs_datascripts}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_network_security_policy_ref+x}" ];
  then params="${params} network_security_policy_ref=\"${PT_network_security_policy_ref}\""
fi

if [ ! -z "${PT_http_policies+x}" ];
  then params="${params} http_policies=\"${PT_http_policies}\""
fi

if [ ! -z "${PT_application_profile_ref+x}" ];
  then params="${params} application_profile_ref=\"${PT_application_profile_ref}\""
fi

if [ ! -z "${PT_microservice_ref+x}" ];
  then params="${params} microservice_ref=\"${PT_microservice_ref}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_ip_address+x}" ];
  then params="${params} ip_address=\"${PT_ip_address}\""
fi

if [ ! -z "${PT_pool_group_ref+x}" ];
  then params="${params} pool_group_ref=\"${PT_pool_group_ref}\""
fi

if [ ! -z "${PT_east_west_placement+x}" ];
  then params="${params} east_west_placement=\"${PT_east_west_placement}\""
fi

if [ ! -z "${PT_subnet_uuid+x}" ];
  then params="${params} subnet_uuid=\"${PT_subnet_uuid}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_service_pool_select+x}" ];
  then params="${params} service_pool_select=\"${PT_service_pool_select}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_enable_autogw+x}" ];
  then params="${params} enable_autogw=\"${PT_enable_autogw}\""
fi

if [ ! -z "${PT_discovered_networks+x}" ];
  then params="${params} discovered_networks=\"${PT_discovered_networks}\""
fi

if [ ! -z "${PT_enabled+x}" ];
  then params="${params} enabled=\"${PT_enabled}\""
fi

if [ ! -z "${PT_content_rewrite+x}" ];
  then params="${params} content_rewrite=\"${PT_content_rewrite}\""
fi

if [ ! -z "${PT_ssl_key_and_certificate_refs+x}" ];
  then params="${params} ssl_key_and_certificate_refs=\"${PT_ssl_key_and_certificate_refs}\""
fi

if [ ! -z "${PT_static_dns_records+x}" ];
  then params="${params} static_dns_records=\"${PT_static_dns_records}\""
fi

if [ ! -z "${PT_analytics_policy+x}" ];
  then params="${params} analytics_policy=\"${PT_analytics_policy}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_network_profile_ref+x}" ];
  then params="${params} network_profile_ref=\"${PT_network_profile_ref}\""
fi

if [ ! -z "${PT_auto_allocate_ip+x}" ];
  then params="${params} auto_allocate_ip=\"${PT_auto_allocate_ip}\""
fi

if [ ! -z "${PT_weight+x}" ];
  then params="${params} weight=\"${PT_weight}\""
fi

if [ ! -z "${PT_tenant_ref+x}" ];
  then params="${params} tenant_ref=\"${PT_tenant_ref}\""
fi

if [ ! -z "${PT_ipam_network_subnet+x}" ];
  then params="${params} ipam_network_subnet=\"${PT_ipam_network_subnet}\""
fi

if [ ! -z "${PT_traffic_clone_profile_ref+x}" ];
  then params="${params} traffic_clone_profile_ref=\"${PT_traffic_clone_profile_ref}\""
fi

if [ ! -z "${PT_avi_allocated_vip+x}" ];
  then params="${params} avi_allocated_vip=\"${PT_avi_allocated_vip}\""
fi

if [ ! -z "${PT_dns_info+x}" ];
  then params="${params} dns_info=\"${PT_dns_info}\""
fi

if [ ! -z "${PT_service_metadata+x}" ];
  then params="${params} service_metadata=\"${PT_service_metadata}\""
fi

if [ ! -z "${PT_vsvip_ref+x}" ];
  then params="${params} vsvip_ref=\"${PT_vsvip_ref}\""
fi

if [ ! -z "${PT_subnet+x}" ];
  then params="${params} subnet=\"${PT_subnet}\""
fi

if [ ! -z "${PT_vrf_context_ref+x}" ];
  then params="${params} vrf_context_ref=\"${PT_vrf_context_ref}\""
fi

if [ ! -z "${PT_cloud_type+x}" ];
  then params="${params} cloud_type=\"${PT_cloud_type}\""
fi

if [ ! -z "${PT_vh_domain_name+x}" ];
  then params="${params} vh_domain_name=\"${PT_vh_domain_name}\""
fi

if [ ! -z "${PT_cloud_ref+x}" ];
  then params="${params} cloud_ref=\"${PT_cloud_ref}\""
fi

if [ ! -z "${PT_enable_rhi+x}" ];
  then params="${params} enable_rhi=\"${PT_enable_rhi}\""
fi

if [ ! -z "${PT_se_group_ref+x}" ];
  then params="${params} se_group_ref=\"${PT_se_group_ref}\""
fi

if [ ! -z "${PT_scaleout_ecmp+x}" ];
  then params="${params} scaleout_ecmp=\"${PT_scaleout_ecmp}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_nsx_securitygroup+x}" ];
  then params="${params} nsx_securitygroup=\"${PT_nsx_securitygroup}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

if [ ! -z "${PT_remove_listening_port_on_vs_down+x}" ];
  then params="${params} remove_listening_port_on_vs_down=\"${PT_remove_listening_port_on_vs_down}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_performance_limits+x}" ];
  then params="${params} performance_limits=\"${PT_performance_limits}\""
fi

if [ ! -z "${PT_use_bridge_ip_as_vip+x}" ];
  then params="${params} use_bridge_ip_as_vip=\"${PT_use_bridge_ip_as_vip}\""
fi

if [ ! -z "${PT_floating_ip+x}" ];
  then params="${params} floating_ip=\"${PT_floating_ip}\""
fi

if [ ! -z "${PT_auto_allocate_floating_ip+x}" ];
  then params="${params} auto_allocate_floating_ip=\"${PT_auto_allocate_floating_ip}\""
fi

if [ ! -z "${PT_host_name_xlate+x}" ];
  then params="${params} host_name_xlate=\"${PT_host_name_xlate}\""
fi

if [ ! -z "${PT_services+x}" ];
  then params="${params} services=\"${PT_services}\""
fi

if [ ! -z "${PT_connections_rate_limit+x}" ];
  then params="${params} connections_rate_limit=\"${PT_connections_rate_limit}\""
fi

if [ ! -z "${PT_active_standby_se_tag+x}" ];
  then params="${params} active_standby_se_tag=\"${PT_active_standby_se_tag}\""
fi

if [ ! -z "${PT_server_network_profile_ref+x}" ];
  then params="${params} server_network_profile_ref=\"${PT_server_network_profile_ref}\""
fi

if [ ! -z "${PT_discovered_network_ref+x}" ];
  then params="${params} discovered_network_ref=\"${PT_discovered_network_ref}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_limit_doser+x}" ];
  then params="${params} limit_doser=\"${PT_limit_doser}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_network_ref+x}" ];
  then params="${params} network_ref=\"${PT_network_ref}\""
fi

if [ ! -z "${PT_fqdn+x}" ];
  then params="${params} fqdn=\"${PT_fqdn}\""
fi

if [ ! -z "${PT_flow_label_type+x}" ];
  then params="${params} flow_label_type=\"${PT_flow_label_type}\""
fi

if [ ! -z "${PT_dns_policies+x}" ];
  then params="${params} dns_policies=\"${PT_dns_policies}\""
fi

if [ ! -z "${PT_cloud_config_cksum+x}" ];
  then params="${params} cloud_config_cksum=\"${PT_cloud_config_cksum}\""
fi

if [ ! -z "${PT_avi_allocated_fip+x}" ];
  then params="${params} avi_allocated_fip=\"${PT_avi_allocated_fip}\""
fi

if [ ! -z "${PT_vh_parent_vs_uuid+x}" ];
  then params="${params} vh_parent_vs_uuid=\"${PT_vh_parent_vs_uuid}\""
fi

ansible localhost -m avi_virtualservice --args "${params}" --one-line | cut -f2- -d">"