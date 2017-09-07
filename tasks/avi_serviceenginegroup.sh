#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_floating_intf_ip+x}" ];
  then params="${params} floating_intf_ip=\"${PT_floating_intf_ip}\""
fi

if [ ! -z "${PT_host_attribute_value+x}" ];
  then params="${params} host_attribute_value=\"${PT_host_attribute_value}\""
fi

if [ ! -z "${PT_async_ssl+x}" ];
  then params="${params} async_ssl=\"${PT_async_ssl}\""
fi

if [ ! -z "${PT_instance_flavor+x}" ];
  then params="${params} instance_flavor=\"${PT_instance_flavor}\""
fi

if [ ! -z "${PT_auto_redistribute_active_standby_load+x}" ];
  then params="${params} auto_redistribute_active_standby_load=\"${PT_auto_redistribute_active_standby_load}\""
fi

if [ ! -z "${PT_auto_rebalance+x}" ];
  then params="${params} auto_rebalance=\"${PT_auto_rebalance}\""
fi

if [ ! -z "${PT_se_tunnel_mode+x}" ];
  then params="${params} se_tunnel_mode=\"${PT_se_tunnel_mode}\""
fi

if [ ! -z "${PT_memory_per_se+x}" ];
  then params="${params} memory_per_se=\"${PT_memory_per_se}\""
fi

if [ ! -z "${PT_extra_config_multiplier+x}" ];
  then params="${params} extra_config_multiplier=\"${PT_extra_config_multiplier}\""
fi

if [ ! -z "${PT_vs_scaleout_timeout+x}" ];
  then params="${params} vs_scaleout_timeout=\"${PT_vs_scaleout_timeout}\""
fi

if [ ! -z "${PT_ha_mode+x}" ];
  then params="${params} ha_mode=\"${PT_ha_mode}\""
fi

if [ ! -z "${PT_cloud_ref+x}" ];
  then params="${params} cloud_ref=\"${PT_cloud_ref}\""
fi

if [ ! -z "${PT_se_remote_punt_udp_port+x}" ];
  then params="${params} se_remote_punt_udp_port=\"${PT_se_remote_punt_udp_port}\""
fi

if [ ! -z "${PT_se_udp_encap_ipc+x}" ];
  then params="${params} se_udp_encap_ipc=\"${PT_se_udp_encap_ipc}\""
fi

if [ ! -z "${PT_min_cpu_usage+x}" ];
  then params="${params} min_cpu_usage=\"${PT_min_cpu_usage}\""
fi

if [ ! -z "${PT_vcenter_clusters+x}" ];
  then params="${params} vcenter_clusters=\"${PT_vcenter_clusters}\""
fi

if [ ! -z "${PT_enable_vip_on_all_interfaces+x}" ];
  then params="${params} enable_vip_on_all_interfaces=\"${PT_enable_vip_on_all_interfaces}\""
fi

if [ ! -z "${PT_active_standby+x}" ];
  then params="${params} active_standby=\"${PT_active_standby}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_max_vs_per_se+x}" ];
  then params="${params} max_vs_per_se=\"${PT_max_vs_per_se}\""
fi

if [ ! -z "${PT_connection_memory_percentage+x}" ];
  then params="${params} connection_memory_percentage=\"${PT_connection_memory_percentage}\""
fi

if [ ! -z "${PT_service_ip_subnets+x}" ];
  then params="${params} service_ip_subnets=\"${PT_service_ip_subnets}\""
fi

if [ ! -z "${PT_placement_mode+x}" ];
  then params="${params} placement_mode=\"${PT_placement_mode}\""
fi

if [ ! -z "${PT_max_scaleout_per_vs+x}" ];
  then params="${params} max_scaleout_per_vs=\"${PT_max_scaleout_per_vs}\""
fi

if [ ! -z "${PT_os_reserved_memory+x}" ];
  then params="${params} os_reserved_memory=\"${PT_os_reserved_memory}\""
fi

if [ ! -z "${PT_openstack_mgmt_network_uuid+x}" ];
  then params="${params} openstack_mgmt_network_uuid=\"${PT_openstack_mgmt_network_uuid}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_per_app+x}" ];
  then params="${params} per_app=\"${PT_per_app}\""
fi

if [ ! -z "${PT_vcenter_datastores_include+x}" ];
  then params="${params} vcenter_datastores_include=\"${PT_vcenter_datastores_include}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_se_vs_hb_max_pkts_in_batch+x}" ];
  then params="${params} se_vs_hb_max_pkts_in_batch=\"${PT_se_vs_hb_max_pkts_in_batch}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_tenant_ref+x}" ];
  then params="${params} tenant_ref=\"${PT_tenant_ref}\""
fi

if [ ! -z "${PT_host_attribute_key+x}" ];
  then params="${params} host_attribute_key=\"${PT_host_attribute_key}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_max_se+x}" ];
  then params="${params} max_se=\"${PT_max_se}\""
fi

if [ ! -z "${PT_hypervisor+x}" ];
  then params="${params} hypervisor=\"${PT_hypervisor}\""
fi

if [ ! -z "${PT_cpu_reserve+x}" ];
  then params="${params} cpu_reserve=\"${PT_cpu_reserve}\""
fi

if [ ! -z "${PT_se_dos_profile+x}" ];
  then params="${params} se_dos_profile=\"${PT_se_dos_profile}\""
fi

if [ ! -z "${PT_enable_vmac+x}" ];
  then params="${params} enable_vmac=\"${PT_enable_vmac}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_iptables+x}" ];
  then params="${params} iptables=\"${PT_iptables}\""
fi

if [ ! -z "${PT_vcenter_hosts+x}" ];
  then params="${params} vcenter_hosts=\"${PT_vcenter_hosts}\""
fi

if [ ! -z "${PT_se_ipc_udp_port+x}" ];
  then params="${params} se_ipc_udp_port=\"${PT_se_ipc_udp_port}\""
fi

if [ ! -z "${PT_vcpus_per_se+x}" ];
  then params="${params} vcpus_per_se=\"${PT_vcpus_per_se}\""
fi

if [ ! -z "${PT_hm_on_standby+x}" ];
  then params="${params} hm_on_standby=\"${PT_hm_on_standby}\""
fi

if [ ! -z "${PT_disk_per_se+x}" ];
  then params="${params} disk_per_se=\"${PT_disk_per_se}\""
fi

if [ ! -z "${PT_cpu_socket_affinity+x}" ];
  then params="${params} cpu_socket_affinity=\"${PT_cpu_socket_affinity}\""
fi

if [ ! -z "${PT_realtime_se_metrics+x}" ];
  then params="${params} realtime_se_metrics=\"${PT_realtime_se_metrics}\""
fi

if [ ! -z "${PT_hardwaresecuritymodulegroup_ref+x}" ];
  then params="${params} hardwaresecuritymodulegroup_ref=\"${PT_hardwaresecuritymodulegroup_ref}\""
fi

if [ ! -z "${PT_custom_tag+x}" ];
  then params="${params} custom_tag=\"${PT_custom_tag}\""
fi

if [ ! -z "${PT_floating_intf_ip_se_2+x}" ];
  then params="${params} floating_intf_ip_se_2=\"${PT_floating_intf_ip_se_2}\""
fi

if [ ! -z "${PT_log_disksz+x}" ];
  then params="${params} log_disksz=\"${PT_log_disksz}\""
fi

if [ ! -z "${PT_openstack_availability_zone+x}" ];
  then params="${params} openstack_availability_zone=\"${PT_openstack_availability_zone}\""
fi

if [ ! -z "${PT_extra_shared_config_memory+x}" ];
  then params="${params} extra_shared_config_memory=\"${PT_extra_shared_config_memory}\""
fi

if [ ! -z "${PT_auto_rebalance_interval+x}" ];
  then params="${params} auto_rebalance_interval=\"${PT_auto_rebalance_interval}\""
fi

if [ ! -z "${PT_buffer_se+x}" ];
  then params="${params} buffer_se=\"${PT_buffer_se}\""
fi

if [ ! -z "${PT_vcenter_datastores+x}" ];
  then params="${params} vcenter_datastores=\"${PT_vcenter_datastores}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_openstack_availability_zones+x}" ];
  then params="${params} openstack_availability_zones=\"${PT_openstack_availability_zones}\""
fi

if [ ! -z "${PT_mgmt_network_ref+x}" ];
  then params="${params} mgmt_network_ref=\"${PT_mgmt_network_ref}\""
fi

if [ ! -z "${PT_num_flow_cores_sum_changes_to_ignore+x}" ];
  then params="${params} num_flow_cores_sum_changes_to_ignore=\"${PT_num_flow_cores_sum_changes_to_ignore}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

if [ ! -z "${PT_se_thread_multiplier+x}" ];
  then params="${params} se_thread_multiplier=\"${PT_se_thread_multiplier}\""
fi

if [ ! -z "${PT_openstack_mgmt_network_name+x}" ];
  then params="${params} openstack_mgmt_network_name=\"${PT_openstack_mgmt_network_name}\""
fi

if [ ! -z "${PT_async_ssl_threads+x}" ];
  then params="${params} async_ssl_threads=\"${PT_async_ssl_threads}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_enable_routing+x}" ];
  then params="${params} enable_routing=\"${PT_enable_routing}\""
fi

if [ ! -z "${PT_vcenter_folder+x}" ];
  then params="${params} vcenter_folder=\"${PT_vcenter_folder}\""
fi

if [ ! -z "${PT_vs_scalein_timeout_for_upgrade+x}" ];
  then params="${params} vs_scalein_timeout_for_upgrade=\"${PT_vs_scalein_timeout_for_upgrade}\""
fi

if [ ! -z "${PT_vs_scalein_timeout+x}" ];
  then params="${params} vs_scalein_timeout=\"${PT_vs_scalein_timeout}\""
fi

if [ ! -z "${PT_se_deprovision_delay+x}" ];
  then params="${params} se_deprovision_delay=\"${PT_se_deprovision_delay}\""
fi

if [ ! -z "${PT_se_vs_hb_max_vs_in_pkt+x}" ];
  then params="${params} se_vs_hb_max_vs_in_pkt=\"${PT_se_vs_hb_max_vs_in_pkt}\""
fi

if [ ! -z "${PT_advertise_backend_networks+x}" ];
  then params="${params} advertise_backend_networks=\"${PT_advertise_backend_networks}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_max_cpu_usage+x}" ];
  then params="${params} max_cpu_usage=\"${PT_max_cpu_usage}\""
fi

if [ ! -z "${PT_min_scaleout_per_vs+x}" ];
  then params="${params} min_scaleout_per_vs=\"${PT_min_scaleout_per_vs}\""
fi

if [ ! -z "${PT_se_name_prefix+x}" ];
  then params="${params} se_name_prefix=\"${PT_se_name_prefix}\""
fi

if [ ! -z "${PT_mem_reserve+x}" ];
  then params="${params} mem_reserve=\"${PT_mem_reserve}\""
fi

if [ ! -z "${PT_vcenter_datastore_mode+x}" ];
  then params="${params} vcenter_datastore_mode=\"${PT_vcenter_datastore_mode}\""
fi

if [ ! -z "${PT_distribute_load_active_standby+x}" ];
  then params="${params} distribute_load_active_standby=\"${PT_distribute_load_active_standby}\""
fi

if [ ! -z "${PT_least_load_core_selection+x}" ];
  then params="${params} least_load_core_selection=\"${PT_least_load_core_selection}\""
fi

if [ ! -z "${PT_aggressive_failure_detection+x}" ];
  then params="${params} aggressive_failure_detection=\"${PT_aggressive_failure_detection}\""
fi

if [ ! -z "${PT_algo+x}" ];
  then params="${params} algo=\"${PT_algo}\""
fi

if [ ! -z "${PT_dedicated_dispatcher_core+x}" ];
  then params="${params} dedicated_dispatcher_core=\"${PT_dedicated_dispatcher_core}\""
fi

if [ ! -z "${PT_mgmt_subnet+x}" ];
  then params="${params} mgmt_subnet=\"${PT_mgmt_subnet}\""
fi

if [ ! -z "${PT_vs_host_redundancy+x}" ];
  then params="${params} vs_host_redundancy=\"${PT_vs_host_redundancy}\""
fi

ansible localhost -m avi_serviceenginegroup --args "${params}" --one-line | cut -f2- -d">"