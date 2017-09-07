#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_server_ip+x}" ];
  then params="${params} server_ip=\"${PT_server_ip}\""
fi

if [ ! -z "${PT_filter_log_name+x}" ];
  then params="${params} filter_log_name=\"${PT_filter_log_name}\""
fi

if [ ! -z "${PT_facility+x}" ];
  then params="${params} facility=\"${PT_facility}\""
fi

if [ ! -z "${PT_ssl_policy_name+x}" ];
  then params="${params} ssl_policy_name=\"${PT_ssl_policy_name}\""
fi

if [ ! -z "${PT_transport_mode+x}" ];
  then params="${params} transport_mode=\"${PT_transport_mode}\""
fi

if [ ! -z "${PT_channel_cfg_name+x}" ];
  then params="${params} channel_cfg_name=\"${PT_channel_cfg_name}\""
fi

if [ ! -z "${PT_suppress_enable+x}" ];
  then params="${params} suppress_enable=\"${PT_suppress_enable}\""
fi

if [ ! -z "${PT_channel_out_direct+x}" ];
  then params="${params} channel_out_direct=\"${PT_channel_out_direct}\""
fi

if [ ! -z "${PT_channel_id+x}" ];
  then params="${params} channel_id=\"${PT_channel_id}\""
fi

if [ ! -z "${PT_filter_feature_name+x}" ];
  then params="${params} filter_feature_name=\"${PT_filter_feature_name}\""
fi

if [ ! -z "${PT_is_default_vpn+x}" ];
  then params="${params} is_default_vpn=\"${PT_is_default_vpn}\""
fi

if [ ! -z "${PT_server_domain+x}" ];
  then params="${params} server_domain=\"${PT_server_domain}\""
fi

if [ ! -z "${PT_level+x}" ];
  then params="${params} level=\"${PT_level}\""
fi

if [ ! -z "${PT_packet_priority+x}" ];
  then params="${params} packet_priority=\"${PT_packet_priority}\""
fi

if [ ! -z "${PT_source_ip+x}" ];
  then params="${params} source_ip=\"${PT_source_ip}\""
fi

if [ ! -z "${PT_channel_name+x}" ];
  then params="${params} channel_name=\"${PT_channel_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_vrf_name+x}" ];
  then params="${params} vrf_name=\"${PT_vrf_name}\""
fi

if [ ! -z "${PT_logfile_max_size+x}" ];
  then params="${params} logfile_max_size=\"${PT_logfile_max_size}\""
fi

if [ ! -z "${PT_server_port+x}" ];
  then params="${params} server_port=\"${PT_server_port}\""
fi

if [ ! -z "${PT_timestamp+x}" ];
  then params="${params} timestamp=\"${PT_timestamp}\""
fi

if [ ! -z "${PT_info_center_enable+x}" ];
  then params="${params} info_center_enable=\"${PT_info_center_enable}\""
fi

if [ ! -z "${PT_ip_type+x}" ];
  then params="${params} ip_type=\"${PT_ip_type}\""
fi

if [ ! -z "${PT_logfile_max_num+x}" ];
  then params="${params} logfile_max_num=\"${PT_logfile_max_num}\""
fi

ansible localhost -m ce_info_center_global --args "${params}" --one-line | cut -f2- -d">"