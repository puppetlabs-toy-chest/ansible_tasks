#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_import_pref_filt_name+x}" ];
  then params="${params} import_pref_filt_name=\"${PT_import_pref_filt_name}\""
fi

if [ ! -z "${PT_advertise_irb+x}" ];
  then params="${params} advertise_irb=\"${PT_advertise_irb}\""
fi

if [ ! -z "${PT_substitute_as_enable+x}" ];
  then params="${params} substitute_as_enable=\"${PT_substitute_as_enable}\""
fi

if [ ! -z "${PT_advertise_ext_community+x}" ];
  then params="${params} advertise_ext_community=\"${PT_advertise_ext_community}\""
fi

if [ ! -z "${PT_default_rt_match_mode+x}" ];
  then params="${params} default_rt_match_mode=\"${PT_default_rt_match_mode}\""
fi

if [ ! -z "${PT_redirect_ip+x}" ];
  then params="${params} redirect_ip=\"${PT_redirect_ip}\""
fi

if [ ! -z "${PT_route_limit+x}" ];
  then params="${params} route_limit=\"${PT_route_limit}\""
fi

if [ ! -z "${PT_import_as_path_filter+x}" ];
  then params="${params} import_as_path_filter=\"${PT_import_as_path_filter}\""
fi

if [ ! -z "${PT_public_as_only_force+x}" ];
  then params="${params} public_as_only_force=\"${PT_public_as_only_force}\""
fi

if [ ! -z "${PT_vpls_enable+x}" ];
  then params="${params} vpls_enable=\"${PT_vpls_enable}\""
fi

if [ ! -z "${PT_allow_as_loop_enable+x}" ];
  then params="${params} allow_as_loop_enable=\"${PT_allow_as_loop_enable}\""
fi

if [ ! -z "${PT_advertise_arp+x}" ];
  then params="${params} advertise_arp=\"${PT_advertise_arp}\""
fi

if [ ! -z "${PT_import_as_path_name_or_num+x}" ];
  then params="${params} import_as_path_name_or_num=\"${PT_import_as_path_name_or_num}\""
fi

if [ ! -z "${PT_af_type+x}" ];
  then params="${params} af_type=\"${PT_af_type}\""
fi

if [ ! -z "${PT_orf_mode+x}" ];
  then params="${params} orf_mode=\"${PT_orf_mode}\""
fi

if [ ! -z "${PT_nexthop_configure+x}" ];
  then params="${params} nexthop_configure=\"${PT_nexthop_configure}\""
fi

if [ ! -z "${PT_discard_ext_community+x}" ];
  then params="${params} discard_ext_community=\"${PT_discard_ext_community}\""
fi

if [ ! -z "${PT_is_nonstd_ipprefix_mod+x}" ];
  then params="${params} is_nonstd_ipprefix_mod=\"${PT_is_nonstd_ipprefix_mod}\""
fi

if [ ! -z "${PT_keep_all_routes+x}" ];
  then params="${params} keep_all_routes=\"${PT_keep_all_routes}\""
fi

if [ ! -z "${PT_orftype+x}" ];
  then params="${params} orftype=\"${PT_orftype}\""
fi

if [ ! -z "${PT_advertise_community+x}" ];
  then params="${params} advertise_community=\"${PT_advertise_community}\""
fi

if [ ! -z "${PT_export_as_path_name_or_num+x}" ];
  then params="${params} export_as_path_name_or_num=\"${PT_export_as_path_name_or_num}\""
fi

if [ ! -z "${PT_adv_add_path_num+x}" ];
  then params="${params} adv_add_path_num=\"${PT_adv_add_path_num}\""
fi

if [ ! -z "${PT_ipprefix_orf_enable+x}" ];
  then params="${params} ipprefix_orf_enable=\"${PT_ipprefix_orf_enable}\""
fi

if [ ! -z "${PT_route_limit_type+x}" ];
  then params="${params} route_limit_type=\"${PT_route_limit_type}\""
fi

if [ ! -z "${PT_remote_address+x}" ];
  then params="${params} remote_address=\"${PT_remote_address}\""
fi

if [ ! -z "${PT_public_as_only_skip_peer_as+x}" ];
  then params="${params} public_as_only_skip_peer_as=\"${PT_public_as_only_skip_peer_as}\""
fi

if [ ! -z "${PT_origin_as_valid+x}" ];
  then params="${params} origin_as_valid=\"${PT_origin_as_valid}\""
fi

if [ ! -z "${PT_route_limit_idle_timeout+x}" ];
  then params="${params} route_limit_idle_timeout=\"${PT_route_limit_idle_timeout}\""
fi

if [ ! -z "${PT_reflect_client+x}" ];
  then params="${params} reflect_client=\"${PT_reflect_client}\""
fi

if [ ! -z "${PT_import_rt_policy_name+x}" ];
  then params="${params} import_rt_policy_name=\"${PT_import_rt_policy_name}\""
fi

if [ ! -z "${PT_route_limit_percent+x}" ];
  then params="${params} route_limit_percent=\"${PT_route_limit_percent}\""
fi

if [ ! -z "${PT_export_rt_policy_name+x}" ];
  then params="${params} export_rt_policy_name=\"${PT_export_rt_policy_name}\""
fi

if [ ! -z "${PT_public_as_only+x}" ];
  then params="${params} public_as_only=\"${PT_public_as_only}\""
fi

if [ ! -z "${PT_redirect_ip_vaildation+x}" ];
  then params="${params} redirect_ip_vaildation=\"${PT_redirect_ip_vaildation}\""
fi

if [ ! -z "${PT_import_acl_name_or_num+x}" ];
  then params="${params} import_acl_name_or_num=\"${PT_import_acl_name_or_num}\""
fi

if [ ! -z "${PT_allow_as_loop_limit+x}" ];
  then params="${params} allow_as_loop_limit=\"${PT_allow_as_loop_limit}\""
fi

if [ ! -z "${PT_add_path_mode+x}" ];
  then params="${params} add_path_mode=\"${PT_add_path_mode}\""
fi

if [ ! -z "${PT_export_as_path_filter+x}" ];
  then params="${params} export_as_path_filter=\"${PT_export_as_path_filter}\""
fi

if [ ! -z "${PT_vpls_ad_disable+x}" ];
  then params="${params} vpls_ad_disable=\"${PT_vpls_ad_disable}\""
fi

if [ ! -z "${PT_public_as_only_replace+x}" ];
  then params="${params} public_as_only_replace=\"${PT_public_as_only_replace}\""
fi

if [ ! -z "${PT_public_as_only_limited+x}" ];
  then params="${params} public_as_only_limited=\"${PT_public_as_only_limited}\""
fi

if [ ! -z "${PT_preferred_value+x}" ];
  then params="${params} preferred_value=\"${PT_preferred_value}\""
fi

if [ ! -z "${PT_export_acl_name_or_num+x}" ];
  then params="${params} export_acl_name_or_num=\"${PT_export_acl_name_or_num}\""
fi

if [ ! -z "${PT_soostring+x}" ];
  then params="${params} soostring=\"${PT_soostring}\""
fi

if [ ! -z "${PT_update_pkt_standard_compatible+x}" ];
  then params="${params} update_pkt_standard_compatible=\"${PT_update_pkt_standard_compatible}\""
fi

if [ ! -z "${PT_advertise_remote_nexthop+x}" ];
  then params="${params} advertise_remote_nexthop=\"${PT_advertise_remote_nexthop}\""
fi

if [ ! -z "${PT_vrf_name+x}" ];
  then params="${params} vrf_name=\"${PT_vrf_name}\""
fi

if [ ! -z "${PT_default_rt_adv_policy+x}" ];
  then params="${params} default_rt_adv_policy=\"${PT_default_rt_adv_policy}\""
fi

if [ ! -z "${PT_export_pref_filt_name+x}" ];
  then params="${params} export_pref_filt_name=\"${PT_export_pref_filt_name}\""
fi

if [ ! -z "${PT_default_rt_adv_enable+x}" ];
  then params="${params} default_rt_adv_enable=\"${PT_default_rt_adv_enable}\""
fi

if [ ! -z "${PT_rt_updt_interval+x}" ];
  then params="${params} rt_updt_interval=\"${PT_rt_updt_interval}\""
fi

ansible localhost -m ce_bgp_neighbor_af --args "${params}" --one-line | cut -f2- -d">"