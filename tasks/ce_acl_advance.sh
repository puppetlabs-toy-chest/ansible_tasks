#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_acl_step+x}" ];
  then params="${params} acl_step=\"${PT_acl_step}\""
fi

if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
fi

if [ ! -z "${PT_precedence+x}" ];
  then params="${params} precedence=\"${PT_precedence}\""
fi

if [ ! -z "${PT_src_port_op+x}" ];
  then params="${params} src_port_op=\"${PT_src_port_op}\""
fi

if [ ! -z "${PT_log_flag+x}" ];
  then params="${params} log_flag=\"${PT_log_flag}\""
fi

if [ ! -z "${PT_time_range+x}" ];
  then params="${params} time_range=\"${PT_time_range}\""
fi

if [ ! -z "${PT_src_port_begin+x}" ];
  then params="${params} src_port_begin=\"${PT_src_port_begin}\""
fi

if [ ! -z "${PT_frag_type+x}" ];
  then params="${params} frag_type=\"${PT_frag_type}\""
fi

if [ ! -z "${PT_dest_port_op+x}" ];
  then params="${params} dest_port_op=\"${PT_dest_port_op}\""
fi

if [ ! -z "${PT_dest_pool_name+x}" ];
  then params="${params} dest_pool_name=\"${PT_dest_pool_name}\""
fi

if [ ! -z "${PT_acl_description+x}" ];
  then params="${params} acl_description=\"${PT_acl_description}\""
fi

if [ ! -z "${PT_ttl_expired+x}" ];
  then params="${params} ttl_expired=\"${PT_ttl_expired}\""
fi

if [ ! -z "${PT_icmp_type+x}" ];
  then params="${params} icmp_type=\"${PT_icmp_type}\""
fi

if [ ! -z "${PT_src_mask+x}" ];
  then params="${params} src_mask=\"${PT_src_mask}\""
fi

if [ ! -z "${PT_icmp_name+x}" ];
  then params="${params} icmp_name=\"${PT_icmp_name}\""
fi

if [ ! -z "${PT_established+x}" ];
  then params="${params} established=\"${PT_established}\""
fi

if [ ! -z "${PT_igmp_type+x}" ];
  then params="${params} igmp_type=\"${PT_igmp_type}\""
fi

if [ ! -z "${PT_tos+x}" ];
  then params="${params} tos=\"${PT_tos}\""
fi

if [ ! -z "${PT_acl_num+x}" ];
  then params="${params} acl_num=\"${PT_acl_num}\""
fi

if [ ! -z "${PT_rule_action+x}" ];
  then params="${params} rule_action=\"${PT_rule_action}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_tcp_flag_mask+x}" ];
  then params="${params} tcp_flag_mask=\"${PT_tcp_flag_mask}\""
fi

if [ ! -z "${PT_src_port_end+x}" ];
  then params="${params} src_port_end=\"${PT_src_port_end}\""
fi

if [ ! -z "${PT_dest_ip+x}" ];
  then params="${params} dest_ip=\"${PT_dest_ip}\""
fi

if [ ! -z "${PT_icmp_code+x}" ];
  then params="${params} icmp_code=\"${PT_icmp_code}\""
fi

if [ ! -z "${PT_dest_port_end+x}" ];
  then params="${params} dest_port_end=\"${PT_dest_port_end}\""
fi

if [ ! -z "${PT_acl_name+x}" ];
  then params="${params} acl_name=\"${PT_acl_name}\""
fi

if [ ! -z "${PT_dscp+x}" ];
  then params="${params} dscp=\"${PT_dscp}\""
fi

if [ ! -z "${PT_rule_name+x}" ];
  then params="${params} rule_name=\"${PT_rule_name}\""
fi

if [ ! -z "${PT_rule_description+x}" ];
  then params="${params} rule_description=\"${PT_rule_description}\""
fi

if [ ! -z "${PT_dest_mask+x}" ];
  then params="${params} dest_mask=\"${PT_dest_mask}\""
fi

if [ ! -z "${PT_src_port_pool_name+x}" ];
  then params="${params} src_port_pool_name=\"${PT_src_port_pool_name}\""
fi

if [ ! -z "${PT_source_ip+x}" ];
  then params="${params} source_ip=\"${PT_source_ip}\""
fi

if [ ! -z "${PT_syn_flag+x}" ];
  then params="${params} syn_flag=\"${PT_syn_flag}\""
fi

if [ ! -z "${PT_vrf_name+x}" ];
  then params="${params} vrf_name=\"${PT_vrf_name}\""
fi

if [ ! -z "${PT_src_pool_name+x}" ];
  then params="${params} src_pool_name=\"${PT_src_pool_name}\""
fi

if [ ! -z "${PT_dest_port_begin+x}" ];
  then params="${params} dest_port_begin=\"${PT_dest_port_begin}\""
fi

if [ ! -z "${PT_dest_port_pool_name+x}" ];
  then params="${params} dest_port_pool_name=\"${PT_dest_port_pool_name}\""
fi

if [ ! -z "${PT_rule_id+x}" ];
  then params="${params} rule_id=\"${PT_rule_id}\""
fi

ansible localhost -m ce_acl_advance --args "${params}" --one-line | cut -f2- -d">"