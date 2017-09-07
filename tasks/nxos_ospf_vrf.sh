#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_router_id+x}" ];
  then params="${params} router_id=\"${PT_router_id}\""
fi

if [ ! -z "${PT_auto_cost+x}" ];
  then params="${params} auto_cost=\"${PT_auto_cost}\""
fi

if [ ! -z "${PT_default_metric+x}" ];
  then params="${params} default_metric=\"${PT_default_metric}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_timer_throttle_spf_max+x}" ];
  then params="${params} timer_throttle_spf_max=\"${PT_timer_throttle_spf_max}\""
fi

if [ ! -z "${PT_vrf+x}" ];
  then params="${params} vrf=\"${PT_vrf}\""
fi

if [ ! -z "${PT_timer_throttle_spf_start+x}" ];
  then params="${params} timer_throttle_spf_start=\"${PT_timer_throttle_spf_start}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

if [ ! -z "${PT_timer_throttle_lsa_max+x}" ];
  then params="${params} timer_throttle_lsa_max=\"${PT_timer_throttle_lsa_max}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_timer_throttle_lsa_hold+x}" ];
  then params="${params} timer_throttle_lsa_hold=\"${PT_timer_throttle_lsa_hold}\""
fi

if [ ! -z "${PT_ospf+x}" ];
  then params="${params} ospf=\"${PT_ospf}\""
fi

if [ ! -z "${PT_log_adjacency+x}" ];
  then params="${params} log_adjacency=\"${PT_log_adjacency}\""
fi

if [ ! -z "${PT_timer_throttle_lsa_start+x}" ];
  then params="${params} timer_throttle_lsa_start=\"${PT_timer_throttle_lsa_start}\""
fi

if [ ! -z "${PT_timer_throttle_spf_hold+x}" ];
  then params="${params} timer_throttle_spf_hold=\"${PT_timer_throttle_spf_hold}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m nxos_ospf_vrf --args "${params}" --one-line | cut -f2- -d">"