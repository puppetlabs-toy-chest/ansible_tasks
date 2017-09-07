#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_reflector_cluster_id+x}" ];
  then params="${params} reflector_cluster_id=\"${PT_reflector_cluster_id}\""
fi

if [ ! -z "${PT_ingress_lsp_policy_name+x}" ];
  then params="${params} ingress_lsp_policy_name=\"${PT_ingress_lsp_policy_name}\""
fi

if [ ! -z "${PT_vrf_rid_auto_sel+x}" ];
  then params="${params} vrf_rid_auto_sel=\"${PT_vrf_rid_auto_sel}\""
fi

if [ ! -z "${PT_preference_internal+x}" ];
  then params="${params} preference_internal=\"${PT_preference_internal}\""
fi

if [ ! -z "${PT_maximum_load_balance+x}" ];
  then params="${params} maximum_load_balance=\"${PT_maximum_load_balance}\""
fi

if [ ! -z "${PT_preference_local+x}" ];
  then params="${params} preference_local=\"${PT_preference_local}\""
fi

if [ ! -z "${PT_preference_external+x}" ];
  then params="${params} preference_external=\"${PT_preference_external}\""
fi

if [ ! -z "${PT_router_id_neglect+x}" ];
  then params="${params} router_id_neglect=\"${PT_router_id_neglect}\""
fi

if [ ! -z "${PT_default_local_pref+x}" ];
  then params="${params} default_local_pref=\"${PT_default_local_pref}\""
fi

if [ ! -z "${PT_reflector_cluster_ipv4+x}" ];
  then params="${params} reflector_cluster_ipv4=\"${PT_reflector_cluster_ipv4}\""
fi

if [ ! -z "${PT_prefrence_policy_name+x}" ];
  then params="${params} prefrence_policy_name=\"${PT_prefrence_policy_name}\""
fi

if [ ! -z "${PT_default_rt_import_enable+x}" ];
  then params="${params} default_rt_import_enable=\"${PT_default_rt_import_enable}\""
fi

if [ ! -z "${PT_nhp_relay_route_policy_name+x}" ];
  then params="${params} nhp_relay_route_policy_name=\"${PT_nhp_relay_route_policy_name}\""
fi

if [ ! -z "${PT_igp_metric_ignore+x}" ];
  then params="${params} igp_metric_ignore=\"${PT_igp_metric_ignore}\""
fi

if [ ! -z "${PT_as_path_neglect+x}" ];
  then params="${params} as_path_neglect=\"${PT_as_path_neglect}\""
fi

if [ ! -z "${PT_auto_frr_enable+x}" ];
  then params="${params} auto_frr_enable=\"${PT_auto_frr_enable}\""
fi

if [ ! -z "${PT_mask_len+x}" ];
  then params="${params} mask_len=\"${PT_mask_len}\""
fi

if [ ! -z "${PT_ibgp_ecmp_nexthop_changed+x}" ];
  then params="${params} ibgp_ecmp_nexthop_changed=\"${PT_ibgp_ecmp_nexthop_changed}\""
fi

if [ ! -z "${PT_af_type+x}" ];
  then params="${params} af_type=\"${PT_af_type}\""
fi

if [ ! -z "${PT_nexthop_third_party+x}" ];
  then params="${params} nexthop_third_party=\"${PT_nexthop_third_party}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_default_med+x}" ];
  then params="${params} default_med=\"${PT_default_med}\""
fi

if [ ! -z "${PT_add_path_sel_num+x}" ];
  then params="${params} add_path_sel_num=\"${PT_add_path_sel_num}\""
fi

if [ ! -z "${PT_med_none_as_maximum+x}" ];
  then params="${params} med_none_as_maximum=\"${PT_med_none_as_maximum}\""
fi

if [ ! -z "${PT_ebgp_ecmp_nexthop_changed+x}" ];
  then params="${params} ebgp_ecmp_nexthop_changed=\"${PT_ebgp_ecmp_nexthop_changed}\""
fi

if [ ! -z "${PT_ecmp_nexthop_changed+x}" ];
  then params="${params} ecmp_nexthop_changed=\"${PT_ecmp_nexthop_changed}\""
fi

if [ ! -z "${PT_lowest_priority+x}" ];
  then params="${params} lowest_priority=\"${PT_lowest_priority}\""
fi

if [ ! -z "${PT_rr_filter_number+x}" ];
  then params="${params} rr_filter_number=\"${PT_rr_filter_number}\""
fi

if [ ! -z "${PT_import_process_id+x}" ];
  then params="${params} import_process_id=\"${PT_import_process_id}\""
fi

if [ ! -z "${PT_router_id+x}" ];
  then params="${params} router_id=\"${PT_router_id}\""
fi

if [ ! -z "${PT_determin_med+x}" ];
  then params="${params} determin_med=\"${PT_determin_med}\""
fi

if [ ! -z "${PT_load_balancing_as_path_ignore+x}" ];
  then params="${params} load_balancing_as_path_ignore=\"${PT_load_balancing_as_path_ignore}\""
fi

if [ ! -z "${PT_reflect_chg_path+x}" ];
  then params="${params} reflect_chg_path=\"${PT_reflect_chg_path}\""
fi

if [ ! -z "${PT_always_compare_med+x}" ];
  then params="${params} always_compare_med=\"${PT_always_compare_med}\""
fi

if [ ! -z "${PT_allow_invalid_as+x}" ];
  then params="${params} allow_invalid_as=\"${PT_allow_invalid_as}\""
fi

if [ ! -z "${PT_relay_delay_enable+x}" ];
  then params="${params} relay_delay_enable=\"${PT_relay_delay_enable}\""
fi

if [ ! -z "${PT_rib_only_policy_name+x}" ];
  then params="${params} rib_only_policy_name=\"${PT_rib_only_policy_name}\""
fi

if [ ! -z "${PT_max_load_ebgp_num+x}" ];
  then params="${params} max_load_ebgp_num=\"${PT_max_load_ebgp_num}\""
fi

if [ ! -z "${PT_import_protocol+x}" ];
  then params="${params} import_protocol=\"${PT_import_protocol}\""
fi

if [ ! -z "${PT_ebgp_if_sensitive+x}" ];
  then params="${params} ebgp_if_sensitive=\"${PT_ebgp_if_sensitive}\""
fi

if [ ! -z "${PT_network_address+x}" ];
  then params="${params} network_address=\"${PT_network_address}\""
fi

if [ ! -z "${PT_supernet_uni_adv+x}" ];
  then params="${params} supernet_uni_adv=\"${PT_supernet_uni_adv}\""
fi

if [ ! -z "${PT_next_hop_sel_depend_type+x}" ];
  then params="${params} next_hop_sel_depend_type=\"${PT_next_hop_sel_depend_type}\""
fi

if [ ! -z "${PT_originator_prior+x}" ];
  then params="${params} originator_prior=\"${PT_originator_prior}\""
fi

if [ ! -z "${PT_active_route_advertise+x}" ];
  then params="${params} active_route_advertise=\"${PT_active_route_advertise}\""
fi

if [ ! -z "${PT_reflect_between_client+x}" ];
  then params="${params} reflect_between_client=\"${PT_reflect_between_client}\""
fi

if [ ! -z "${PT_policy_vpn_target+x}" ];
  then params="${params} policy_vpn_target=\"${PT_policy_vpn_target}\""
fi

if [ ! -z "${PT_summary_automatic+x}" ];
  then params="${params} summary_automatic=\"${PT_summary_automatic}\""
fi

if [ ! -z "${PT_rib_only_enable+x}" ];
  then params="${params} rib_only_enable=\"${PT_rib_only_enable}\""
fi

if [ ! -z "${PT_max_load_ibgp_num+x}" ];
  then params="${params} max_load_ibgp_num=\"${PT_max_load_ibgp_num}\""
fi

if [ ! -z "${PT_route_sel_delay+x}" ];
  then params="${params} route_sel_delay=\"${PT_route_sel_delay}\""
fi

if [ ! -z "${PT_supernet_label_adv+x}" ];
  then params="${params} supernet_label_adv=\"${PT_supernet_label_adv}\""
fi

if [ ! -z "${PT_vrf_name+x}" ];
  then params="${params} vrf_name=\"${PT_vrf_name}\""
fi

if [ ! -z "${PT_policy_ext_comm_enable+x}" ];
  then params="${params} policy_ext_comm_enable=\"${PT_policy_ext_comm_enable}\""
fi

ansible localhost -m ce_bgp_af --args "${params}" --one-line | cut -f2- -d">"