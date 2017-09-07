#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_conn_name+x}" ];
  then params="${params} conn_name=\"${PT_conn_name}\""
fi

if [ ! -z "${PT_ingress+x}" ];
  then params="${params} ingress=\"${PT_ingress}\""
fi

if [ ! -z "${PT_slavepriority+x}" ];
  then params="${params} slavepriority=\"${PT_slavepriority}\""
fi

if [ ! -z "${PT_path_cost+x}" ];
  then params="${params} path_cost=\"${PT_path_cost}\""
fi

if [ ! -z "${PT_vlandev+x}" ];
  then params="${params} vlandev=\"${PT_vlandev}\""
fi

if [ ! -z "${PT_forwarddelay+x}" ];
  then params="${params} forwarddelay=\"${PT_forwarddelay}\""
fi

if [ ! -z "${PT_primary+x}" ];
  then params="${params} primary=\"${PT_primary}\""
fi

if [ ! -z "${PT_hairpin+x}" ];
  then params="${params} hairpin=\"${PT_hairpin}\""
fi

if [ ! -z "${PT_egress+x}" ];
  then params="${params} egress=\"${PT_egress}\""
fi

if [ ! -z "${PT_ageingtime+x}" ];
  then params="${params} ageingtime=\"${PT_ageingtime}\""
fi

if [ ! -z "${PT_dns4+x}" ];
  then params="${params} dns4=\"${PT_dns4}\""
fi

if [ ! -z "${PT_arp_ip_target+x}" ];
  then params="${params} arp_ip_target=\"${PT_arp_ip_target}\""
fi

if [ ! -z "${PT_maxage+x}" ];
  then params="${params} maxage=\"${PT_maxage}\""
fi

if [ ! -z "${PT_vlanid+x}" ];
  then params="${params} vlanid=\"${PT_vlanid}\""
fi

if [ ! -z "${PT_priority+x}" ];
  then params="${params} priority=\"${PT_priority}\""
fi

if [ ! -z "${PT_gw4+x}" ];
  then params="${params} gw4=\"${PT_gw4}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_gw6+x}" ];
  then params="${params} gw6=\"${PT_gw6}\""
fi

if [ ! -z "${PT_master+x}" ];
  then params="${params} master=\"${PT_master}\""
fi

if [ ! -z "${PT_stp+x}" ];
  then params="${params} stp=\"${PT_stp}\""
fi

if [ ! -z "${PT_ifname+x}" ];
  then params="${params} ifname=\"${PT_ifname}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_miimon+x}" ];
  then params="${params} miimon=\"${PT_miimon}\""
fi

if [ ! -z "${PT_hellotime+x}" ];
  then params="${params} hellotime=\"${PT_hellotime}\""
fi

if [ ! -z "${PT_downdelay+x}" ];
  then params="${params} downdelay=\"${PT_downdelay}\""
fi

if [ ! -z "${PT_mac+x}" ];
  then params="${params} mac=\"${PT_mac}\""
fi

if [ ! -z "${PT_ip6+x}" ];
  then params="${params} ip6=\"${PT_ip6}\""
fi

if [ ! -z "${PT_ip4+x}" ];
  then params="${params} ip4=\"${PT_ip4}\""
fi

if [ ! -z "${PT_autoconnect+x}" ];
  then params="${params} autoconnect=\"${PT_autoconnect}\""
fi

if [ ! -z "${PT_dns6+x}" ];
  then params="${params} dns6=\"${PT_dns6}\""
fi

if [ ! -z "${PT_mtu+x}" ];
  then params="${params} mtu=\"${PT_mtu}\""
fi

if [ ! -z "${PT_arp_interval+x}" ];
  then params="${params} arp_interval=\"${PT_arp_interval}\""
fi

if [ ! -z "${PT_flags+x}" ];
  then params="${params} flags=\"${PT_flags}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_updelay+x}" ];
  then params="${params} updelay=\"${PT_updelay}\""
fi

ansible localhost -m nmcli --args "${params}" --one-line | cut -f2- -d">"