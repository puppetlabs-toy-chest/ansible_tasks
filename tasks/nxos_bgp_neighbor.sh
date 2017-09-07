#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_update_source+x}" ];
  then params="${params} update_source=\"${PT_update_source}\""
fi

if [ ! -z "${PT_capability_negotiation+x}" ];
  then params="${params} capability_negotiation=\"${PT_capability_negotiation}\""
fi

if [ ! -z "${PT_pwd_type+x}" ];
  then params="${params} pwd_type=\"${PT_pwd_type}\""
fi

if [ ! -z "${PT_dynamic_capability+x}" ];
  then params="${params} dynamic_capability=\"${PT_dynamic_capability}\""
fi

if [ ! -z "${PT_shutdown+x}" ];
  then params="${params} shutdown=\"${PT_shutdown}\""
fi

if [ ! -z "${PT_low_memory_exempt+x}" ];
  then params="${params} low_memory_exempt=\"${PT_low_memory_exempt}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_remove_private_as+x}" ];
  then params="${params} remove_private_as=\"${PT_remove_private_as}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

if [ ! -z "${PT_connected_check+x}" ];
  then params="${params} connected_check=\"${PT_connected_check}\""
fi

if [ ! -z "${PT_remote_as+x}" ];
  then params="${params} remote_as=\"${PT_remote_as}\""
fi

if [ ! -z "${PT_ebgp_multihop+x}" ];
  then params="${params} ebgp_multihop=\"${PT_ebgp_multihop}\""
fi

if [ ! -z "${PT_asn+x}" ];
  then params="${params} asn=\"${PT_asn}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_timers_holdtime+x}" ];
  then params="${params} timers_holdtime=\"${PT_timers_holdtime}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_local_as+x}" ];
  then params="${params} local_as=\"${PT_local_as}\""
fi

if [ ! -z "${PT_timers_keepalive+x}" ];
  then params="${params} timers_keepalive=\"${PT_timers_keepalive}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_vrf+x}" ];
  then params="${params} vrf=\"${PT_vrf}\""
fi

if [ ! -z "${PT_log_neighbor_changes+x}" ];
  then params="${params} log_neighbor_changes=\"${PT_log_neighbor_changes}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_maximum_peers+x}" ];
  then params="${params} maximum_peers=\"${PT_maximum_peers}\""
fi

if [ ! -z "${PT_suppress_4_byte_as+x}" ];
  then params="${params} suppress_4_byte_as=\"${PT_suppress_4_byte_as}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_pwd+x}" ];
  then params="${params} pwd=\"${PT_pwd}\""
fi

if [ ! -z "${PT_transport_passive_only+x}" ];
  then params="${params} transport_passive_only=\"${PT_transport_passive_only}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_neighbor+x}" ];
  then params="${params} neighbor=\"${PT_neighbor}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m nxos_bgp_neighbor --args "${params}" --one-line | cut -f2- -d">"