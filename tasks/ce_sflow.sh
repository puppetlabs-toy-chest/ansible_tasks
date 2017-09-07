#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_agent_ip+x}" ];
  then params="${params} agent_ip=\"${PT_agent_ip}\""
fi

if [ ! -z "${PT_export_route+x}" ];
  then params="${params} export_route=\"${PT_export_route}\""
fi

if [ ! -z "${PT_counter_collector+x}" ];
  then params="${params} counter_collector=\"${PT_counter_collector}\""
fi

if [ ! -z "${PT_rate_limit_slot+x}" ];
  then params="${params} rate_limit_slot=\"${PT_rate_limit_slot}\""
fi

if [ ! -z "${PT_source_ip+x}" ];
  then params="${params} source_ip=\"${PT_source_ip}\""
fi

if [ ! -z "${PT_collector_datagram_size+x}" ];
  then params="${params} collector_datagram_size=\"${PT_collector_datagram_size}\""
fi

if [ ! -z "${PT_sample_collector+x}" ];
  then params="${params} sample_collector=\"${PT_sample_collector}\""
fi

if [ ! -z "${PT_rate_limit+x}" ];
  then params="${params} rate_limit=\"${PT_rate_limit}\""
fi

if [ ! -z "${PT_sample_direction+x}" ];
  then params="${params} sample_direction=\"${PT_sample_direction}\""
fi

if [ ! -z "${PT_collector_meth+x}" ];
  then params="${params} collector_meth=\"${PT_collector_meth}\""
fi

if [ ! -z "${PT_collector_ip_vpn+x}" ];
  then params="${params} collector_ip_vpn=\"${PT_collector_ip_vpn}\""
fi

if [ ! -z "${PT_forward_enp_slot+x}" ];
  then params="${params} forward_enp_slot=\"${PT_forward_enp_slot}\""
fi

if [ ! -z "${PT_collector_ip+x}" ];
  then params="${params} collector_ip=\"${PT_collector_ip}\""
fi

if [ ! -z "${PT_sflow_interface+x}" ];
  then params="${params} sflow_interface=\"${PT_sflow_interface}\""
fi

if [ ! -z "${PT_sample_length+x}" ];
  then params="${params} sample_length=\"${PT_sample_length}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_collector_id+x}" ];
  then params="${params} collector_id=\"${PT_collector_id}\""
fi

if [ ! -z "${PT_sample_rate+x}" ];
  then params="${params} sample_rate=\"${PT_sample_rate}\""
fi

if [ ! -z "${PT_collector_udp_port+x}" ];
  then params="${params} collector_udp_port=\"${PT_collector_udp_port}\""
fi

if [ ! -z "${PT_counter_interval+x}" ];
  then params="${params} counter_interval=\"${PT_counter_interval}\""
fi

if [ ! -z "${PT_collector_description+x}" ];
  then params="${params} collector_description=\"${PT_collector_description}\""
fi

ansible localhost -m ce_sflow --args "${params}" --one-line | cut -f2- -d">"