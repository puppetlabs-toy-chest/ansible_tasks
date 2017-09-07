#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_table_map_filter+x}" ];
  then params="${params} table_map_filter=\"${PT_table_map_filter}\""
fi

if [ ! -z "${PT_dampening_max_suppress_time+x}" ];
  then params="${params} dampening_max_suppress_time=\"${PT_dampening_max_suppress_time}\""
fi

if [ ! -z "${PT_additional_paths_send+x}" ];
  then params="${params} additional_paths_send=\"${PT_additional_paths_send}\""
fi

if [ ! -z "${PT_additional_paths_install+x}" ];
  then params="${params} additional_paths_install=\"${PT_additional_paths_install}\""
fi

if [ ! -z "${PT_networks+x}" ];
  then params="${params} networks=\"${PT_networks}\""
fi

if [ ! -z "${PT_dampening_state+x}" ];
  then params="${params} dampening_state=\"${PT_dampening_state}\""
fi

if [ ! -z "${PT_additional_paths_receive+x}" ];
  then params="${params} additional_paths_receive=\"${PT_additional_paths_receive}\""
fi

if [ ! -z "${PT_suppress_inactive+x}" ];
  then params="${params} suppress_inactive=\"${PT_suppress_inactive}\""
fi

if [ ! -z "${PT_dampening_routemap+x}" ];
  then params="${params} dampening_routemap=\"${PT_dampening_routemap}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

if [ ! -z "${PT_distance_local+x}" ];
  then params="${params} distance_local=\"${PT_distance_local}\""
fi

if [ ! -z "${PT_advertise_l2vpn_evpn+x}" ];
  then params="${params} advertise_l2vpn_evpn=\"${PT_advertise_l2vpn_evpn}\""
fi

if [ ! -z "${PT_afi+x}" ];
  then params="${params} afi=\"${PT_afi}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_distance_ibgp+x}" ];
  then params="${params} distance_ibgp=\"${PT_distance_ibgp}\""
fi

if [ ! -z "${PT_default_information_originate+x}" ];
  then params="${params} default_information_originate=\"${PT_default_information_originate}\""
fi

if [ ! -z "${PT_next_hop_route_map+x}" ];
  then params="${params} next_hop_route_map=\"${PT_next_hop_route_map}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_table_map+x}" ];
  then params="${params} table_map=\"${PT_table_map}\""
fi

if [ ! -z "${PT_safi+x}" ];
  then params="${params} safi=\"${PT_safi}\""
fi

if [ ! -z "${PT_default_metric+x}" ];
  then params="${params} default_metric=\"${PT_default_metric}\""
fi

if [ ! -z "${PT_client_to_client+x}" ];
  then params="${params} client_to_client=\"${PT_client_to_client}\""
fi

if [ ! -z "${PT_dampen_igp_metric+x}" ];
  then params="${params} dampen_igp_metric=\"${PT_dampen_igp_metric}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_additional_paths_selection+x}" ];
  then params="${params} additional_paths_selection=\"${PT_additional_paths_selection}\""
fi

if [ ! -z "${PT_maximum_paths_ibgp+x}" ];
  then params="${params} maximum_paths_ibgp=\"${PT_maximum_paths_ibgp}\""
fi

if [ ! -z "${PT_vrf+x}" ];
  then params="${params} vrf=\"${PT_vrf}\""
fi

if [ ! -z "${PT_distance_ebgp+x}" ];
  then params="${params} distance_ebgp=\"${PT_distance_ebgp}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_asn+x}" ];
  then params="${params} asn=\"${PT_asn}\""
fi

if [ ! -z "${PT_redistribute+x}" ];
  then params="${params} redistribute=\"${PT_redistribute}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_dampening_reuse_time+x}" ];
  then params="${params} dampening_reuse_time=\"${PT_dampening_reuse_time}\""
fi

if [ ! -z "${PT_maximum_paths+x}" ];
  then params="${params} maximum_paths=\"${PT_maximum_paths}\""
fi

if [ ! -z "${PT_inject_map+x}" ];
  then params="${params} inject_map=\"${PT_inject_map}\""
fi

if [ ! -z "${PT_dampening_suppress_time+x}" ];
  then params="${params} dampening_suppress_time=\"${PT_dampening_suppress_time}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_dampening_half_time+x}" ];
  then params="${params} dampening_half_time=\"${PT_dampening_half_time}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m nxos_bgp_af --args "${params}" --one-line | cut -f2- -d">"