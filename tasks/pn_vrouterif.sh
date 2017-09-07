#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_pn_nic_enable+x}" ];
  then params="${params} pn_nic_enable=\"${PT_pn_nic_enable}\""
fi

if [ ! -z "${PT_pn_vrouter_name+x}" ];
  then params="${params} pn_vrouter_name=\"${PT_pn_vrouter_name}\""
fi

if [ ! -z "${PT_pn_vrrp_adv_int+x}" ];
  then params="${params} pn_vrrp_adv_int=\"${PT_pn_vrrp_adv_int}\""
fi

if [ ! -z "${PT_pn_vrrp_priority+x}" ];
  then params="${params} pn_vrrp_priority=\"${PT_pn_vrrp_priority}\""
fi

if [ ! -z "${PT_pn_alias+x}" ];
  then params="${params} pn_alias=\"${PT_pn_alias}\""
fi

if [ ! -z "${PT_pn_secondary_macs+x}" ];
  then params="${params} pn_secondary_macs=\"${PT_pn_secondary_macs}\""
fi

if [ ! -z "${PT_pn_interface_ip+x}" ];
  then params="${params} pn_interface_ip=\"${PT_pn_interface_ip}\""
fi

if [ ! -z "${PT_pn_vlan+x}" ];
  then params="${params} pn_vlan=\"${PT_pn_vlan}\""
fi

if [ ! -z "${PT_pn_vxlan+x}" ];
  then params="${params} pn_vxlan=\"${PT_pn_vxlan}\""
fi

if [ ! -z "${PT_pn_exclusive+x}" ];
  then params="${params} pn_exclusive=\"${PT_pn_exclusive}\""
fi

if [ ! -z "${PT_pn_nic_str+x}" ];
  then params="${params} pn_nic_str=\"${PT_pn_nic_str}\""
fi

if [ ! -z "${PT_pn_clipassword+x}" ];
  then params="${params} pn_clipassword=\"${PT_pn_clipassword}\""
fi

if [ ! -z "${PT_pn_vrrp_id+x}" ];
  then params="${params} pn_vrrp_id=\"${PT_pn_vrrp_id}\""
fi

if [ ! -z "${PT_pn_cliusername+x}" ];
  then params="${params} pn_cliusername=\"${PT_pn_cliusername}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_pn_interface+x}" ];
  then params="${params} pn_interface=\"${PT_pn_interface}\""
fi

if [ ! -z "${PT_pn_l3port+x}" ];
  then params="${params} pn_l3port=\"${PT_pn_l3port}\""
fi

if [ ! -z "${PT_pn_cliswitch+x}" ];
  then params="${params} pn_cliswitch=\"${PT_pn_cliswitch}\""
fi

if [ ! -z "${PT_pn_assignment+x}" ];
  then params="${params} pn_assignment=\"${PT_pn_assignment}\""
fi

ansible localhost -m pn_vrouterif --args "${params}" --one-line | cut -f2- -d">"