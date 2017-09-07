#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_neighbor_down_fib_accelerate+x}" ];
  then params="${params} neighbor_down_fib_accelerate=\"${PT_neighbor_down_fib_accelerate}\""
fi

if [ ! -z "${PT_confederation_peers+x}" ];
  then params="${params} confederation_peers=\"${PT_confederation_peers}\""
fi

if [ ! -z "${PT_confederation_id+x}" ];
  then params="${params} confederation_id=\"${PT_confederation_id}\""
fi

if [ ! -z "${PT_graceful_restart_helper+x}" ];
  then params="${params} graceful_restart_helper=\"${PT_graceful_restart_helper}\""
fi

if [ ! -z "${PT_bestpath_always_compare_med+x}" ];
  then params="${params} bestpath_always_compare_med=\"${PT_bestpath_always_compare_med}\""
fi

if [ ! -z "${PT_cluster_id+x}" ];
  then params="${params} cluster_id=\"${PT_cluster_id}\""
fi

if [ ! -z "${PT_shutdown+x}" ];
  then params="${params} shutdown=\"${PT_shutdown}\""
fi

if [ ! -z "${PT_timer_bgp_hold+x}" ];
  then params="${params} timer_bgp_hold=\"${PT_timer_bgp_hold}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_bestpath_aspath_multipath_relax+x}" ];
  then params="${params} bestpath_aspath_multipath_relax=\"${PT_bestpath_aspath_multipath_relax}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

if [ ! -z "${PT_graceful_restart_timers_stalepath_time+x}" ];
  then params="${params} graceful_restart_timers_stalepath_time=\"${PT_graceful_restart_timers_stalepath_time}\""
fi

if [ ! -z "${PT_maxas_limit+x}" ];
  then params="${params} maxas_limit=\"${PT_maxas_limit}\""
fi

if [ ! -z "${PT_bestpath_med_confed+x}" ];
  then params="${params} bestpath_med_confed=\"${PT_bestpath_med_confed}\""
fi

if [ ! -z "${PT_isolate+x}" ];
  then params="${params} isolate=\"${PT_isolate}\""
fi

if [ ! -z "${PT_timer_bgp_keepalive+x}" ];
  then params="${params} timer_bgp_keepalive=\"${PT_timer_bgp_keepalive}\""
fi

if [ ! -z "${PT_bestpath_cost_community_ignore+x}" ];
  then params="${params} bestpath_cost_community_ignore=\"${PT_bestpath_cost_community_ignore}\""
fi

if [ ! -z "${PT_fast_external_fallover+x}" ];
  then params="${params} fast_external_fallover=\"${PT_fast_external_fallover}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_disable_policy_batching+x}" ];
  then params="${params} disable_policy_batching=\"${PT_disable_policy_batching}\""
fi

if [ ! -z "${PT_disable_policy_batching_ipv6_prefix_list+x}" ];
  then params="${params} disable_policy_batching_ipv6_prefix_list=\"${PT_disable_policy_batching_ipv6_prefix_list}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_bestpath_med_missing_as_worst+x}" ];
  then params="${params} bestpath_med_missing_as_worst=\"${PT_bestpath_med_missing_as_worst}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_timer_bestpath_limit+x}" ];
  then params="${params} timer_bestpath_limit=\"${PT_timer_bestpath_limit}\""
fi

if [ ! -z "${PT_suppress_fib_pending+x}" ];
  then params="${params} suppress_fib_pending=\"${PT_suppress_fib_pending}\""
fi

if [ ! -z "${PT_local_as+x}" ];
  then params="${params} local_as=\"${PT_local_as}\""
fi

if [ ! -z "${PT_event_history_periodic+x}" ];
  then params="${params} event_history_periodic=\"${PT_event_history_periodic}\""
fi

if [ ! -z "${PT_timer_bestpath_limit_always+x}" ];
  then params="${params} timer_bestpath_limit_always=\"${PT_timer_bestpath_limit_always}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_disable_policy_batching_ipv4_prefix_list+x}" ];
  then params="${params} disable_policy_batching_ipv4_prefix_list=\"${PT_disable_policy_batching_ipv4_prefix_list}\""
fi

if [ ! -z "${PT_vrf+x}" ];
  then params="${params} vrf=\"${PT_vrf}\""
fi

if [ ! -z "${PT_event_history_cli+x}" ];
  then params="${params} event_history_cli=\"${PT_event_history_cli}\""
fi

if [ ! -z "${PT_log_neighbor_changes+x}" ];
  then params="${params} log_neighbor_changes=\"${PT_log_neighbor_changes}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_asn+x}" ];
  then params="${params} asn=\"${PT_asn}\""
fi

if [ ! -z "${PT_event_history_events+x}" ];
  then params="${params} event_history_events=\"${PT_event_history_events}\""
fi

if [ ! -z "${PT_event_history_detail+x}" ];
  then params="${params} event_history_detail=\"${PT_event_history_detail}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_graceful_restart+x}" ];
  then params="${params} graceful_restart=\"${PT_graceful_restart}\""
fi

if [ ! -z "${PT_flush_routes+x}" ];
  then params="${params} flush_routes=\"${PT_flush_routes}\""
fi

if [ ! -z "${PT_enforce_first_as+x}" ];
  then params="${params} enforce_first_as=\"${PT_enforce_first_as}\""
fi

if [ ! -z "${PT_bestpath_med_non_deterministic+x}" ];
  then params="${params} bestpath_med_non_deterministic=\"${PT_bestpath_med_non_deterministic}\""
fi

if [ ! -z "${PT_reconnect_interval+x}" ];
  then params="${params} reconnect_interval=\"${PT_reconnect_interval}\""
fi

if [ ! -z "${PT_router_id+x}" ];
  then params="${params} router_id=\"${PT_router_id}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_graceful_restart_timers_restart+x}" ];
  then params="${params} graceful_restart_timers_restart=\"${PT_graceful_restart_timers_restart}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_bestpath_compare_routerid+x}" ];
  then params="${params} bestpath_compare_routerid=\"${PT_bestpath_compare_routerid}\""
fi

ansible localhost -m nxos_bgp --args "${params}" --one-line | cut -f2- -d">"