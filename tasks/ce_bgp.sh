#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_router_id+x}" ];
  then params="${params} router_id=\"${PT_router_id}\""
fi

if [ ! -z "${PT_memory_limit+x}" ];
  then params="${params} memory_limit=\"${PT_memory_limit}\""
fi

if [ ! -z "${PT_vrf_rid_auto_sel+x}" ];
  then params="${params} vrf_rid_auto_sel=\"${PT_vrf_rid_auto_sel}\""
fi

if [ ! -z "${PT_suppress_interval+x}" ];
  then params="${params} suppress_interval=\"${PT_suppress_interval}\""
fi

if [ ! -z "${PT_as_number+x}" ];
  then params="${params} as_number=\"${PT_as_number}\""
fi

if [ ! -z "${PT_confed_id_number+x}" ];
  then params="${params} confed_id_number=\"${PT_confed_id_number}\""
fi

if [ ! -z "${PT_bgp_rid_auto_sel+x}" ];
  then params="${params} bgp_rid_auto_sel=\"${PT_bgp_rid_auto_sel}\""
fi

if [ ! -z "${PT_default_af_type+x}" ];
  then params="${params} default_af_type=\"${PT_default_af_type}\""
fi

if [ ! -z "${PT_conn_retry_time+x}" ];
  then params="${params} conn_retry_time=\"${PT_conn_retry_time}\""
fi

if [ ! -z "${PT_is_shutdown+x}" ];
  then params="${params} is_shutdown=\"${PT_is_shutdown}\""
fi

if [ ! -z "${PT_keepalive_time+x}" ];
  then params="${params} keepalive_time=\"${PT_keepalive_time}\""
fi

if [ ! -z "${PT_confed_peer_as_num+x}" ];
  then params="${params} confed_peer_as_num=\"${PT_confed_peer_as_num}\""
fi

if [ ! -z "${PT_min_hold_time+x}" ];
  then params="${params} min_hold_time=\"${PT_min_hold_time}\""
fi

if [ ! -z "${PT_ebgp_if_sensitive+x}" ];
  then params="${params} ebgp_if_sensitive=\"${PT_ebgp_if_sensitive}\""
fi

if [ ! -z "${PT_check_first_as+x}" ];
  then params="${params} check_first_as=\"${PT_check_first_as}\""
fi

if [ ! -z "${PT_clear_interval+x}" ];
  then params="${params} clear_interval=\"${PT_clear_interval}\""
fi

if [ ! -z "${PT_confed_nonstanded+x}" ];
  then params="${params} confed_nonstanded=\"${PT_confed_nonstanded}\""
fi

if [ ! -z "${PT_time_wait_for_rib+x}" ];
  then params="${params} time_wait_for_rib=\"${PT_time_wait_for_rib}\""
fi

if [ ! -z "${PT_hold_time+x}" ];
  then params="${params} hold_time=\"${PT_hold_time}\""
fi

if [ ! -z "${PT_as_path_limit+x}" ];
  then params="${params} as_path_limit=\"${PT_as_path_limit}\""
fi

if [ ! -z "${PT_hold_interval+x}" ];
  then params="${params} hold_interval=\"${PT_hold_interval}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_vrf_name+x}" ];
  then params="${params} vrf_name=\"${PT_vrf_name}\""
fi

if [ ! -z "${PT_keep_all_routes+x}" ];
  then params="${params} keep_all_routes=\"${PT_keep_all_routes}\""
fi

if [ ! -z "${PT_gr_peer_reset+x}" ];
  then params="${params} gr_peer_reset=\"${PT_gr_peer_reset}\""
fi

if [ ! -z "${PT_graceful_restart+x}" ];
  then params="${params} graceful_restart=\"${PT_graceful_restart}\""
fi

ansible localhost -m ce_bgp --args "${params}" --one-line | cut -f2- -d">"