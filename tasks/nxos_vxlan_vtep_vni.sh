#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_save+x}" ];
  then params="${params} save=\"${PT_save}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_suppress_arp+x}" ];
  then params="${params} suppress_arp=\"${PT_suppress_arp}\""
fi

if [ ! -z "${PT_include_defaults+x}" ];
  then params="${params} include_defaults=\"${PT_include_defaults}\""
fi

if [ ! -z "${PT_ingress_replication+x}" ];
  then params="${params} ingress_replication=\"${PT_ingress_replication}\""
fi

if [ ! -z "${PT_config+x}" ];
  then params="${params} config=\"${PT_config}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_vni+x}" ];
  then params="${params} vni=\"${PT_vni}\""
fi

if [ ! -z "${PT_multicast_group+x}" ];
  then params="${params} multicast_group=\"${PT_multicast_group}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_assoc_vrf+x}" ];
  then params="${params} assoc_vrf=\"${PT_assoc_vrf}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

if [ ! -z "${PT_peer_list+x}" ];
  then params="${params} peer_list=\"${PT_peer_list}\""
fi

ansible localhost -m nxos_vxlan_vtep_vni --args "${params}" --one-line | cut -f2- -d">"