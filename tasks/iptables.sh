#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
fi

if [ ! -z "${PT_goto+x}" ];
  then params="${params} goto=\"${PT_goto}\""
fi

if [ ! -z "${PT_chain+x}" ];
  then params="${params} chain=\"${PT_chain}\""
fi

if [ ! -z "${PT_fragment+x}" ];
  then params="${params} fragment=\"${PT_fragment}\""
fi

if [ ! -z "${PT_out_interface+x}" ];
  then params="${params} out_interface=\"${PT_out_interface}\""
fi

if [ ! -z "${PT_to_source+x}" ];
  then params="${params} to_source=\"${PT_to_source}\""
fi

if [ ! -z "${PT_limit_burst+x}" ];
  then params="${params} limit_burst=\"${PT_limit_burst}\""
fi

if [ ! -z "${PT_ctstate+x}" ];
  then params="${params} ctstate=\"${PT_ctstate}\""
fi

if [ ! -z "${PT_jump+x}" ];
  then params="${params} jump=\"${PT_jump}\""
fi

if [ ! -z "${PT_policy+x}" ];
  then params="${params} policy=\"${PT_policy}\""
fi

if [ ! -z "${PT_source_port+x}" ];
  then params="${params} source_port=\"${PT_source_port}\""
fi

if [ ! -z "${PT_to_ports+x}" ];
  then params="${params} to_ports=\"${PT_to_ports}\""
fi

if [ ! -z "${PT_flush+x}" ];
  then params="${params} flush=\"${PT_flush}\""
fi

if [ ! -z "${PT_table+x}" ];
  then params="${params} table=\"${PT_table}\""
fi

if [ ! -z "${PT_destination_port+x}" ];
  then params="${params} destination_port=\"${PT_destination_port}\""
fi

if [ ! -z "${PT_icmp_type+x}" ];
  then params="${params} icmp_type=\"${PT_icmp_type}\""
fi

if [ ! -z "${PT_to_destination+x}" ];
  then params="${params} to_destination=\"${PT_to_destination}\""
fi

if [ ! -z "${PT_in_interface+x}" ];
  then params="${params} in_interface=\"${PT_in_interface}\""
fi

if [ ! -z "${PT_uid_owner+x}" ];
  then params="${params} uid_owner=\"${PT_uid_owner}\""
fi

if [ ! -z "${PT_set_dscp_mark_class+x}" ];
  then params="${params} set_dscp_mark_class=\"${PT_set_dscp_mark_class}\""
fi

if [ ! -z "${PT_destination+x}" ];
  then params="${params} destination=\"${PT_destination}\""
fi

if [ ! -z "${PT_set_dscp_mark+x}" ];
  then params="${params} set_dscp_mark=\"${PT_set_dscp_mark}\""
fi

if [ ! -z "${PT_reject_with+x}" ];
  then params="${params} reject_with=\"${PT_reject_with}\""
fi

if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_limit+x}" ];
  then params="${params} limit=\"${PT_limit}\""
fi

if [ ! -z "${PT_action+x}" ];
  then params="${params} action=\"${PT_action}\""
fi

if [ ! -z "${PT_set_counters+x}" ];
  then params="${params} set_counters=\"${PT_set_counters}\""
fi

if [ ! -z "${PT_ip_version+x}" ];
  then params="${params} ip_version=\"${PT_ip_version}\""
fi

if [ ! -z "${PT_match+x}" ];
  then params="${params} match=\"${PT_match}\""
fi

ansible localhost -m iptables --args "${params}" --one-line | cut -f2- -d">"