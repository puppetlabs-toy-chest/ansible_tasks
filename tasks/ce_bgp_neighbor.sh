#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_prepend_global_as+x}" ];
  then params="${params} prepend_global_as=\"${PT_prepend_global_as}\""
fi

if [ ! -z "${PT_ebgp_max_hop+x}" ];
  then params="${params} ebgp_max_hop=\"${PT_ebgp_max_hop}\""
fi

if [ ! -z "${PT_is_ignore+x}" ];
  then params="${params} is_ignore=\"${PT_is_ignore}\""
fi

if [ ! -z "${PT_prepend_fake_as+x}" ];
  then params="${params} prepend_fake_as=\"${PT_prepend_fake_as}\""
fi

if [ ! -z "${PT_fake_as+x}" ];
  then params="${params} fake_as=\"${PT_fake_as}\""
fi

if [ ! -z "${PT_is_single_hop+x}" ];
  then params="${params} is_single_hop=\"${PT_is_single_hop}\""
fi

if [ ! -z "${PT_conventional+x}" ];
  then params="${params} conventional=\"${PT_conventional}\""
fi

if [ ! -z "${PT_remote_as+x}" ];
  then params="${params} remote_as=\"${PT_remote_as}\""
fi

if [ ! -z "${PT_hold_time+x}" ];
  then params="${params} hold_time=\"${PT_hold_time}\""
fi

if [ ! -z "${PT_tx_interval+x}" ];
  then params="${params} tx_interval=\"${PT_tx_interval}\""
fi

if [ ! -z "${PT_pswd_cipher_text+x}" ];
  then params="${params} pswd_cipher_text=\"${PT_pswd_cipher_text}\""
fi

if [ ! -z "${PT_local_if_name+x}" ];
  then params="${params} local_if_name=\"${PT_local_if_name}\""
fi

if [ ! -z "${PT_rx_interval+x}" ];
  then params="${params} rx_interval=\"${PT_rx_interval}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_vrf_name+x}" ];
  then params="${params} vrf_name=\"${PT_vrf_name}\""
fi

if [ ! -z "${PT_dual_as+x}" ];
  then params="${params} dual_as=\"${PT_dual_as}\""
fi

if [ ! -z "${PT_connect_mode+x}" ];
  then params="${params} connect_mode=\"${PT_connect_mode}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_is_log_change+x}" ];
  then params="${params} is_log_change=\"${PT_is_log_change}\""
fi

if [ ! -z "${PT_keep_alive_time+x}" ];
  then params="${params} keep_alive_time=\"${PT_keep_alive_time}\""
fi

if [ ! -z "${PT_key_chain_name+x}" ];
  then params="${params} key_chain_name=\"${PT_key_chain_name}\""
fi

if [ ! -z "${PT_conn_retry_time+x}" ];
  then params="${params} conn_retry_time=\"${PT_conn_retry_time}\""
fi

if [ ! -z "${PT_min_hold_time+x}" ];
  then params="${params} min_hold_time=\"${PT_min_hold_time}\""
fi

if [ ! -z "${PT_multiplier+x}" ];
  then params="${params} multiplier=\"${PT_multiplier}\""
fi

if [ ! -z "${PT_valid_ttl_hops+x}" ];
  then params="${params} valid_ttl_hops=\"${PT_valid_ttl_hops}\""
fi

if [ ! -z "${PT_is_bfd_block+x}" ];
  then params="${params} is_bfd_block=\"${PT_is_bfd_block}\""
fi

if [ ! -z "${PT_tcp_MSS+x}" ];
  then params="${params} tcp_MSS=\"${PT_tcp_MSS}\""
fi

if [ ! -z "${PT_is_bfd_enable+x}" ];
  then params="${params} is_bfd_enable=\"${PT_is_bfd_enable}\""
fi

if [ ! -z "${PT_route_refresh+x}" ];
  then params="${params} route_refresh=\"${PT_route_refresh}\""
fi

if [ ! -z "${PT_peer_addr+x}" ];
  then params="${params} peer_addr=\"${PT_peer_addr}\""
fi

if [ ! -z "${PT_pswd_type+x}" ];
  then params="${params} pswd_type=\"${PT_pswd_type}\""
fi

if [ ! -z "${PT_mpls_local_ifnet_disable+x}" ];
  then params="${params} mpls_local_ifnet_disable=\"${PT_mpls_local_ifnet_disable}\""
fi

ansible localhost -m ce_bgp_neighbor --args "${params}" --one-line | cut -f2- -d">"