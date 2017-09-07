#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_disable_se_analytics+x}" ];
  then params="${params} disable_se_analytics=\"${PT_disable_se_analytics}\""
fi

if [ ! -z "${PT_apdex_server_rtt_tolerated_factor+x}" ];
  then params="${params} apdex_server_rtt_tolerated_factor=\"${PT_apdex_server_rtt_tolerated_factor}\""
fi

if [ ! -z "${PT_hs_security_tls12_score+x}" ];
  then params="${params} hs_security_tls12_score=\"${PT_hs_security_tls12_score}\""
fi

if [ ! -z "${PT_exclude_no_dns_record_as_error+x}" ];
  then params="${params} exclude_no_dns_record_as_error=\"${PT_exclude_no_dns_record_as_error}\""
fi

if [ ! -z "${PT_conn_server_lossy_zero_win_size_event_threshold+x}" ];
  then params="${params} conn_server_lossy_zero_win_size_event_threshold=\"${PT_conn_server_lossy_zero_win_size_event_threshold}\""
fi

if [ ! -z "${PT_conn_lossy_total_rexmt_threshold+x}" ];
  then params="${params} conn_lossy_total_rexmt_threshold=\"${PT_conn_lossy_total_rexmt_threshold}\""
fi

if [ ! -z "${PT_hs_pscore_traffic_threshold_l4_client+x}" ];
  then params="${params} hs_pscore_traffic_threshold_l4_client=\"${PT_hs_pscore_traffic_threshold_l4_client}\""
fi

if [ ! -z "${PT_exclude_no_valid_gs_member_as_error+x}" ];
  then params="${params} exclude_no_valid_gs_member_as_error=\"${PT_exclude_no_valid_gs_member_as_error}\""
fi

if [ ! -z "${PT_hs_security_cipherscore_ge128b+x}" ];
  then params="${params} hs_security_cipherscore_ge128b=\"${PT_hs_security_cipherscore_ge128b}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_exclude_invalid_dns_domain_as_error+x}" ];
  then params="${params} exclude_invalid_dns_domain_as_error=\"${PT_exclude_invalid_dns_domain_as_error}\""
fi

if [ ! -z "${PT_exclude_http_error_codes+x}" ];
  then params="${params} exclude_http_error_codes=\"${PT_exclude_http_error_codes}\""
fi

if [ ! -z "${PT_hs_max_anomaly_penalty+x}" ];
  then params="${params} hs_max_anomaly_penalty=\"${PT_hs_max_anomaly_penalty}\""
fi

if [ ! -z "${PT_conn_server_lossy_ooo_threshold+x}" ];
  then params="${params} conn_server_lossy_ooo_threshold=\"${PT_conn_server_lossy_ooo_threshold}\""
fi

if [ ! -z "${PT_exclude_persistence_change_as_error+x}" ];
  then params="${params} exclude_persistence_change_as_error=\"${PT_exclude_persistence_change_as_error}\""
fi

if [ ! -z "${PT_hs_security_selfsignedcert_penalty+x}" ];
  then params="${params} hs_security_selfsignedcert_penalty=\"${PT_hs_security_selfsignedcert_penalty}\""
fi

if [ ! -z "${PT_conn_server_lossy_total_rexmt_threshold+x}" ];
  then params="${params} conn_server_lossy_total_rexmt_threshold=\"${PT_conn_server_lossy_total_rexmt_threshold}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_hs_security_certscore_le30d+x}" ];
  then params="${params} hs_security_certscore_le30d=\"${PT_hs_security_certscore_le30d}\""
fi

if [ ! -z "${PT_exclude_syn_retransmit_as_error+x}" ];
  then params="${params} exclude_syn_retransmit_as_error=\"${PT_exclude_syn_retransmit_as_error}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_hs_security_hsts_penalty+x}" ];
  then params="${params} hs_security_hsts_penalty=\"${PT_hs_security_hsts_penalty}\""
fi

if [ ! -z "${PT_hs_pscore_traffic_threshold_l4_server+x}" ];
  then params="${params} hs_pscore_traffic_threshold_l4_server=\"${PT_hs_pscore_traffic_threshold_l4_server}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_conn_lossy_zero_win_size_event_threshold+x}" ];
  then params="${params} conn_lossy_zero_win_size_event_threshold=\"${PT_conn_lossy_zero_win_size_event_threshold}\""
fi

if [ ! -z "${PT_hs_security_encalgo_score_rc4+x}" ];
  then params="${params} hs_security_encalgo_score_rc4=\"${PT_hs_security_encalgo_score_rc4}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_apdex_rtt_threshold+x}" ];
  then params="${params} apdex_rtt_threshold=\"${PT_apdex_rtt_threshold}\""
fi

if [ ! -z "${PT_tenant_ref+x}" ];
  then params="${params} tenant_ref=\"${PT_tenant_ref}\""
fi

if [ ! -z "${PT_apdex_response_tolerated_factor+x}" ];
  then params="${params} apdex_response_tolerated_factor=\"${PT_apdex_response_tolerated_factor}\""
fi

if [ ! -z "${PT_exclude_tcp_reset_as_error+x}" ];
  then params="${params} exclude_tcp_reset_as_error=\"${PT_exclude_tcp_reset_as_error}\""
fi

if [ ! -z "${PT_hs_max_security_penalty+x}" ];
  then params="${params} hs_max_security_penalty=\"${PT_hs_max_security_penalty}\""
fi

if [ ! -z "${PT_exclude_invalid_dns_query_as_error+x}" ];
  then params="${params} exclude_invalid_dns_query_as_error=\"${PT_exclude_invalid_dns_query_as_error}\""
fi

if [ ! -z "${PT_conn_lossy_ooo_threshold+x}" ];
  then params="${params} conn_lossy_ooo_threshold=\"${PT_conn_lossy_ooo_threshold}\""
fi

if [ ! -z "${PT_hs_security_cipherscore_lt128b+x}" ];
  then params="${params} hs_security_cipherscore_lt128b=\"${PT_hs_security_cipherscore_lt128b}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_hs_event_throttle_window+x}" ];
  then params="${params} hs_event_throttle_window=\"${PT_hs_event_throttle_window}\""
fi

if [ ! -z "${PT_hs_security_nonpfs_penalty+x}" ];
  then params="${params} hs_security_nonpfs_penalty=\"${PT_hs_security_nonpfs_penalty}\""
fi

if [ ! -z "${PT_hs_security_certscore_gt30d+x}" ];
  then params="${params} hs_security_certscore_gt30d=\"${PT_hs_security_certscore_gt30d}\""
fi

if [ ! -z "${PT_exclude_server_tcp_reset_as_error+x}" ];
  then params="${params} exclude_server_tcp_reset_as_error=\"${PT_exclude_server_tcp_reset_as_error}\""
fi

if [ ! -z "${PT_hs_min_dos_rate+x}" ];
  then params="${params} hs_min_dos_rate=\"${PT_hs_min_dos_rate}\""
fi

if [ ! -z "${PT_hs_max_resources_penalty+x}" ];
  then params="${params} hs_max_resources_penalty=\"${PT_hs_max_resources_penalty}\""
fi

if [ ! -z "${PT_client_log_streaming_config+x}" ];
  then params="${params} client_log_streaming_config=\"${PT_client_log_streaming_config}\""
fi

if [ ! -z "${PT_apdex_server_response_threshold+x}" ];
  then params="${params} apdex_server_response_threshold=\"${PT_apdex_server_response_threshold}\""
fi

if [ ! -z "${PT_hs_performance_boost+x}" ];
  then params="${params} hs_performance_boost=\"${PT_hs_performance_boost}\""
fi

if [ ! -z "${PT_hs_security_ssl30_score+x}" ];
  then params="${params} hs_security_ssl30_score=\"${PT_hs_security_ssl30_score}\""
fi

if [ ! -z "${PT_hs_security_tls11_score+x}" ];
  then params="${params} hs_security_tls11_score=\"${PT_hs_security_tls11_score}\""
fi

if [ ! -z "${PT_exclude_gs_down_as_error+x}" ];
  then params="${params} exclude_gs_down_as_error=\"${PT_exclude_gs_down_as_error}\""
fi

if [ ! -z "${PT_apdex_server_response_tolerated_factor+x}" ];
  then params="${params} apdex_server_response_tolerated_factor=\"${PT_apdex_server_response_tolerated_factor}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_disable_server_analytics+x}" ];
  then params="${params} disable_server_analytics=\"${PT_disable_server_analytics}\""
fi

if [ ! -z "${PT_conn_server_lossy_timeo_rexmt_threshold+x}" ];
  then params="${params} conn_server_lossy_timeo_rexmt_threshold=\"${PT_conn_server_lossy_timeo_rexmt_threshold}\""
fi

if [ ! -z "${PT_exclude_client_close_before_request_as_error+x}" ];
  then params="${params} exclude_client_close_before_request_as_error=\"${PT_exclude_client_close_before_request_as_error}\""
fi

if [ ! -z "${PT_hs_security_weak_signature_algo_penalty+x}" ];
  then params="${params} hs_security_weak_signature_algo_penalty=\"${PT_hs_security_weak_signature_algo_penalty}\""
fi

if [ ! -z "${PT_conn_lossy_timeo_rexmt_threshold+x}" ];
  then params="${params} conn_lossy_timeo_rexmt_threshold=\"${PT_conn_lossy_timeo_rexmt_threshold}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

if [ ! -z "${PT_apdex_rtt_tolerated_factor+x}" ];
  then params="${params} apdex_rtt_tolerated_factor=\"${PT_apdex_rtt_tolerated_factor}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_client_log_config+x}" ];
  then params="${params} client_log_config=\"${PT_client_log_config}\""
fi

if [ ! -z "${PT_apdex_rum_tolerated_factor+x}" ];
  then params="${params} apdex_rum_tolerated_factor=\"${PT_apdex_rum_tolerated_factor}\""
fi

if [ ! -z "${PT_hs_security_cipherscore_eq000b+x}" ];
  then params="${params} hs_security_cipherscore_eq000b=\"${PT_hs_security_cipherscore_eq000b}\""
fi

if [ ! -z "${PT_ranges+x}" ];
  then params="${params} ranges=\"${PT_ranges}\""
fi

if [ ! -z "${PT_apdex_server_rtt_threshold+x}" ];
  then params="${params} apdex_server_rtt_threshold=\"${PT_apdex_server_rtt_threshold}\""
fi

if [ ! -z "${PT_exclude_server_dns_error_as_error+x}" ];
  then params="${params} exclude_server_dns_error_as_error=\"${PT_exclude_server_dns_error_as_error}\""
fi

if [ ! -z "${PT_hs_security_certscore_le07d+x}" ];
  then params="${params} hs_security_certscore_le07d=\"${PT_hs_security_certscore_le07d}\""
fi

if [ ! -z "${PT_resp_code_block+x}" ];
  then params="${params} resp_code_block=\"${PT_resp_code_block}\""
fi

if [ ! -z "${PT_hs_security_encalgo_score_none+x}" ];
  then params="${params} hs_security_encalgo_score_none=\"${PT_hs_security_encalgo_score_none}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_apdex_rum_threshold+x}" ];
  then params="${params} apdex_rum_threshold=\"${PT_apdex_rum_threshold}\""
fi

if [ ! -z "${PT_hs_security_chain_invalidity_penalty+x}" ];
  then params="${params} hs_security_chain_invalidity_penalty=\"${PT_hs_security_chain_invalidity_penalty}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_hs_security_tls10_score+x}" ];
  then params="${params} hs_security_tls10_score=\"${PT_hs_security_tls10_score}\""
fi

if [ ! -z "${PT_hs_security_certscore_expired+x}" ];
  then params="${params} hs_security_certscore_expired=\"${PT_hs_security_certscore_expired}\""
fi

if [ ! -z "${PT_apdex_response_threshold+x}" ];
  then params="${params} apdex_response_threshold=\"${PT_apdex_response_threshold}\""
fi

if [ ! -z "${PT_exclude_unsupported_dns_query_as_error+x}" ];
  then params="${params} exclude_unsupported_dns_query_as_error=\"${PT_exclude_unsupported_dns_query_as_error}\""
fi

ansible localhost -m avi_analyticsprofile --args "${params}" --one-line | cut -f2- -d">"