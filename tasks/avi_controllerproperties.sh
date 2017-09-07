#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_vs_se_ping_fail+x}" ];
  then params="${params} vs_se_ping_fail=\"${PT_vs_se_ping_fail}\""
fi

if [ ! -z "${PT_vs_se_create_fail+x}" ];
  then params="${params} vs_se_create_fail=\"${PT_vs_se_create_fail}\""
fi

if [ ! -z "${PT_portal_token+x}" ];
  then params="${params} portal_token=\"${PT_portal_token}\""
fi

if [ ! -z "${PT_warmstart_se_reconnect_wait_time+x}" ];
  then params="${params} warmstart_se_reconnect_wait_time=\"${PT_warmstart_se_reconnect_wait_time}\""
fi

if [ ! -z "${PT_persistence_key_rotate_period+x}" ];
  then params="${params} persistence_key_rotate_period=\"${PT_persistence_key_rotate_period}\""
fi

if [ ! -z "${PT_unresponsive_se_reboot+x}" ];
  then params="${params} unresponsive_se_reboot=\"${PT_unresponsive_se_reboot}\""
fi

if [ ! -z "${PT_attach_ip_retry_interval+x}" ];
  then params="${params} attach_ip_retry_interval=\"${PT_attach_ip_retry_interval}\""
fi

if [ ! -z "${PT_vs_se_vnic_fail+x}" ];
  then params="${params} vs_se_vnic_fail=\"${PT_vs_se_vnic_fail}\""
fi

if [ ! -z "${PT_attach_ip_retry_limit+x}" ];
  then params="${params} attach_ip_retry_limit=\"${PT_attach_ip_retry_limit}\""
fi

if [ ! -z "${PT_se_vnic_cooldown+x}" ];
  then params="${params} se_vnic_cooldown=\"${PT_se_vnic_cooldown}\""
fi

if [ ! -z "${PT_vnic_op_fail_time+x}" ];
  then params="${params} vnic_op_fail_time=\"${PT_vnic_op_fail_time}\""
fi

if [ ! -z "${PT_max_pcap_per_tenant+x}" ];
  then params="${params} max_pcap_per_tenant=\"${PT_max_pcap_per_tenant}\""
fi

if [ ! -z "${PT_vs_se_bootup_fail+x}" ];
  then params="${params} vs_se_bootup_fail=\"${PT_vs_se_bootup_fail}\""
fi

if [ ! -z "${PT_seupgrade_fabric_pool_size+x}" ];
  then params="${params} seupgrade_fabric_pool_size=\"${PT_seupgrade_fabric_pool_size}\""
fi

if [ ! -z "${PT_vs_key_rotate_period+x}" ];
  then params="${params} vs_key_rotate_period=\"${PT_vs_key_rotate_period}\""
fi

if [ ! -z "${PT_seupgrade_segroup_min_dead_timeout+x}" ];
  then params="${params} seupgrade_segroup_min_dead_timeout=\"${PT_seupgrade_segroup_min_dead_timeout}\""
fi

if [ ! -z "${PT_dns_refresh_period+x}" ];
  then params="${params} dns_refresh_period=\"${PT_dns_refresh_period}\""
fi

if [ ! -z "${PT_upgrade_lease_time+x}" ];
  then params="${params} upgrade_lease_time=\"${PT_upgrade_lease_time}\""
fi

if [ ! -z "${PT_se_create_timeout+x}" ];
  then params="${params} se_create_timeout=\"${PT_se_create_timeout}\""
fi

if [ ! -z "${PT_query_host_fail+x}" ];
  then params="${params} query_host_fail=\"${PT_query_host_fail}\""
fi

if [ ! -z "${PT_vs_apic_scaleout_timeout+x}" ];
  then params="${params} vs_apic_scaleout_timeout=\"${PT_vs_apic_scaleout_timeout}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_se_offline_del+x}" ];
  then params="${params} se_offline_del=\"${PT_se_offline_del}\""
fi

if [ ! -z "${PT_max_dead_se_in_grp+x}" ];
  then params="${params} max_dead_se_in_grp=\"${PT_max_dead_se_in_grp}\""
fi

if [ ! -z "${PT_upgrade_dns_ttl+x}" ];
  then params="${params} upgrade_dns_ttl=\"${PT_upgrade_dns_ttl}\""
fi

if [ ! -z "${PT_fatal_error_lease_time+x}" ];
  then params="${params} fatal_error_lease_time=\"${PT_fatal_error_lease_time}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_allow_ip_forwarding+x}" ];
  then params="${params} allow_ip_forwarding=\"${PT_allow_ip_forwarding}\""
fi

if [ ! -z "${PT_max_seq_vnic_failures+x}" ];
  then params="${params} max_seq_vnic_failures=\"${PT_max_seq_vnic_failures}\""
fi

if [ ! -z "${PT_allow_unauthenticated_nodes+x}" ];
  then params="${params} allow_unauthenticated_nodes=\"${PT_allow_unauthenticated_nodes}\""
fi

if [ ! -z "${PT_allow_unauthenticated_apis+x}" ];
  then params="${params} allow_unauthenticated_apis=\"${PT_allow_unauthenticated_apis}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_vs_awaiting_se_timeout+x}" ];
  then params="${params} vs_awaiting_se_timeout=\"${PT_vs_awaiting_se_timeout}\""
fi

if [ ! -z "${PT_cluster_ip_gratuitous_arp_period+x}" ];
  then params="${params} cluster_ip_gratuitous_arp_period=\"${PT_cluster_ip_gratuitous_arp_period}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_dummy+x}" ];
  then params="${params} dummy=\"${PT_dummy}\""
fi

if [ ! -z "${PT_secure_channel_cleanup_timeout+x}" ];
  then params="${params} secure_channel_cleanup_timeout=\"${PT_secure_channel_cleanup_timeout}\""
fi

if [ ! -z "${PT_vs_se_vnic_ip_fail+x}" ];
  then params="${params} vs_se_vnic_ip_fail=\"${PT_vs_se_vnic_ip_fail}\""
fi

if [ ! -z "${PT_ssl_certificate_expiry_warning_days+x}" ];
  then params="${params} ssl_certificate_expiry_warning_days=\"${PT_ssl_certificate_expiry_warning_days}\""
fi

if [ ! -z "${PT_secure_channel_se_token_timeout+x}" ];
  then params="${params} secure_channel_se_token_timeout=\"${PT_secure_channel_se_token_timeout}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_secure_channel_controller_token_timeout+x}" ];
  then params="${params} secure_channel_controller_token_timeout=\"${PT_secure_channel_controller_token_timeout}\""
fi

if [ ! -z "${PT_api_idle_timeout+x}" ];
  then params="${params} api_idle_timeout=\"${PT_api_idle_timeout}\""
fi

if [ ! -z "${PT_crashed_se_reboot+x}" ];
  then params="${params} crashed_se_reboot=\"${PT_crashed_se_reboot}\""
fi

if [ ! -z "${PT_appviewx_compat_mode+x}" ];
  then params="${params} appviewx_compat_mode=\"${PT_appviewx_compat_mode}\""
fi

if [ ! -z "${PT_se_failover_attempt_interval+x}" ];
  then params="${params} se_failover_attempt_interval=\"${PT_se_failover_attempt_interval}\""
fi

if [ ! -z "${PT_dead_se_detection_timer+x}" ];
  then params="${params} dead_se_detection_timer=\"${PT_dead_se_detection_timer}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

ansible localhost -m avi_controllerproperties --args "${params}" --one-line | cut -f2- -d">"