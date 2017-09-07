#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_default_originate+x}" ];
  then params="${params} default_originate=\"${PT_default_originate}\""
fi

if [ ! -z "${PT_next_hop_self+x}" ];
  then params="${params} next_hop_self=\"${PT_next_hop_self}\""
fi

if [ ! -z "${PT_suppress_inactive+x}" ];
  then params="${params} suppress_inactive=\"${PT_suppress_inactive}\""
fi

if [ ! -z "${PT_additional_paths_send+x}" ];
  then params="${params} additional_paths_send=\"${PT_additional_paths_send}\""
fi

if [ ! -z "${PT_soo+x}" ];
  then params="${params} soo=\"${PT_soo}\""
fi

if [ ! -z "${PT_additional_paths_receive+x}" ];
  then params="${params} additional_paths_receive=\"${PT_additional_paths_receive}\""
fi

if [ ! -z "${PT_route_reflector_client+x}" ];
  then params="${params} route_reflector_client=\"${PT_route_reflector_client}\""
fi

if [ ! -z "${PT_prefix_list_out+x}" ];
  then params="${params} prefix_list_out=\"${PT_prefix_list_out}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_as_override+x}" ];
  then params="${params} as_override=\"${PT_as_override}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

if [ ! -z "${PT_filter_list_out+x}" ];
  then params="${params} filter_list_out=\"${PT_filter_list_out}\""
fi

if [ ! -z "${PT_afi+x}" ];
  then params="${params} afi=\"${PT_afi}\""
fi

if [ ! -z "${PT_allowas_in+x}" ];
  then params="${params} allowas_in=\"${PT_allowas_in}\""
fi

if [ ! -z "${PT_max_prefix_warning+x}" ];
  then params="${params} max_prefix_warning=\"${PT_max_prefix_warning}\""
fi

if [ ! -z "${PT_asn+x}" ];
  then params="${params} asn=\"${PT_asn}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_advertise_map_non_exist+x}" ];
  then params="${params} advertise_map_non_exist=\"${PT_advertise_map_non_exist}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_default_originate_route_map+x}" ];
  then params="${params} default_originate_route_map=\"${PT_default_originate_route_map}\""
fi

if [ ! -z "${PT_neighbor+x}" ];
  then params="${params} neighbor=\"${PT_neighbor}\""
fi

if [ ! -z "${PT_safi+x}" ];
  then params="${params} safi=\"${PT_safi}\""
fi

if [ ! -z "${PT_filter_list_in+x}" ];
  then params="${params} filter_list_in=\"${PT_filter_list_in}\""
fi

if [ ! -z "${PT_weight+x}" ];
  then params="${params} weight=\"${PT_weight}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_soft_reconfiguration_in+x}" ];
  then params="${params} soft_reconfiguration_in=\"${PT_soft_reconfiguration_in}\""
fi

if [ ! -z "${PT_vrf+x}" ];
  then params="${params} vrf=\"${PT_vrf}\""
fi

if [ ! -z "${PT_unsuppress_map+x}" ];
  then params="${params} unsuppress_map=\"${PT_unsuppress_map}\""
fi

if [ ! -z "${PT_max_prefix_limit+x}" ];
  then params="${params} max_prefix_limit=\"${PT_max_prefix_limit}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_max_prefix_threshold+x}" ];
  then params="${params} max_prefix_threshold=\"${PT_max_prefix_threshold}\""
fi

if [ ! -z "${PT_route_map_in+x}" ];
  then params="${params} route_map_in=\"${PT_route_map_in}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_max_prefix_interval+x}" ];
  then params="${params} max_prefix_interval=\"${PT_max_prefix_interval}\""
fi

if [ ! -z "${PT_route_map_out+x}" ];
  then params="${params} route_map_out=\"${PT_route_map_out}\""
fi

if [ ! -z "${PT_send_community+x}" ];
  then params="${params} send_community=\"${PT_send_community}\""
fi

if [ ! -z "${PT_prefix_list_in+x}" ];
  then params="${params} prefix_list_in=\"${PT_prefix_list_in}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_next_hop_third_party+x}" ];
  then params="${params} next_hop_third_party=\"${PT_next_hop_third_party}\""
fi

if [ ! -z "${PT_advertise_map_exist+x}" ];
  then params="${params} advertise_map_exist=\"${PT_advertise_map_exist}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_allowas_in_max+x}" ];
  then params="${params} allowas_in_max=\"${PT_allowas_in_max}\""
fi

ansible localhost -m nxos_bgp_neighbor_af --args "${params}" --one-line | cut -f2- -d">"