#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_loop_protection+x}" ];
  then params="${params} loop_protection=\"${PT_loop_protection}\""
fi

if [ ! -z "${PT_tc_protection_threshold+x}" ];
  then params="${params} tc_protection_threshold=\"${PT_tc_protection_threshold}\""
fi

if [ ! -z "${PT_bpdu_filter+x}" ];
  then params="${params} bpdu_filter=\"${PT_bpdu_filter}\""
fi

if [ ! -z "${PT_stp_converge+x}" ];
  then params="${params} stp_converge=\"${PT_stp_converge}\""
fi

if [ ! -z "${PT_stp_mode+x}" ];
  then params="${params} stp_mode=\"${PT_stp_mode}\""
fi

if [ ! -z "${PT_bpdu_protection+x}" ];
  then params="${params} bpdu_protection=\"${PT_bpdu_protection}\""
fi

if [ ! -z "${PT_root_protection+x}" ];
  then params="${params} root_protection=\"${PT_root_protection}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_cost+x}" ];
  then params="${params} cost=\"${PT_cost}\""
fi

if [ ! -z "${PT_stp_enable+x}" ];
  then params="${params} stp_enable=\"${PT_stp_enable}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_tc_protection+x}" ];
  then params="${params} tc_protection=\"${PT_tc_protection}\""
fi

if [ ! -z "${PT_edged_port+x}" ];
  then params="${params} edged_port=\"${PT_edged_port}\""
fi

if [ ! -z "${PT_tc_protection_interval+x}" ];
  then params="${params} tc_protection_interval=\"${PT_tc_protection_interval}\""
fi

ansible localhost -m ce_stp --args "${params}" --one-line | cut -f2- -d">"