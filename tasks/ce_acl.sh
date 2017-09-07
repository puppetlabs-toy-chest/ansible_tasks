#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_acl_step+x}" ];
  then params="${params} acl_step=\"${PT_acl_step}\""
fi

if [ ! -z "${PT_acl_name+x}" ];
  then params="${params} acl_name=\"${PT_acl_name}\""
fi

if [ ! -z "${PT_log_flag+x}" ];
  then params="${params} log_flag=\"${PT_log_flag}\""
fi

if [ ! -z "${PT_source_ip+x}" ];
  then params="${params} source_ip=\"${PT_source_ip}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_src_mask+x}" ];
  then params="${params} src_mask=\"${PT_src_mask}\""
fi

if [ ! -z "${PT_rule_action+x}" ];
  then params="${params} rule_action=\"${PT_rule_action}\""
fi

if [ ! -z "${PT_rule_name+x}" ];
  then params="${params} rule_name=\"${PT_rule_name}\""
fi

if [ ! -z "${PT_acl_num+x}" ];
  then params="${params} acl_num=\"${PT_acl_num}\""
fi

if [ ! -z "${PT_vrf_name+x}" ];
  then params="${params} vrf_name=\"${PT_vrf_name}\""
fi

if [ ! -z "${PT_acl_description+x}" ];
  then params="${params} acl_description=\"${PT_acl_description}\""
fi

if [ ! -z "${PT_rule_id+x}" ];
  then params="${params} rule_id=\"${PT_rule_id}\""
fi

if [ ! -z "${PT_time_range+x}" ];
  then params="${params} time_range=\"${PT_time_range}\""
fi

if [ ! -z "${PT_rule_description+x}" ];
  then params="${params} rule_description=\"${PT_rule_description}\""
fi

if [ ! -z "${PT_frag_type+x}" ];
  then params="${params} frag_type=\"${PT_frag_type}\""
fi

ansible localhost -m ce_acl --args "${params}" --one-line | cut -f2- -d">"