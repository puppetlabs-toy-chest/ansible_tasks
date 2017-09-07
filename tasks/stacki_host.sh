#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_prim_intf_ip+x}" ];
  then params="${params} prim_intf_ip=\"${PT_prim_intf_ip}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_stacki_user+x}" ];
  then params="${params} stacki_user=\"${PT_stacki_user}\""
fi

if [ ! -z "${PT_stacki_endpoint+x}" ];
  then params="${params} stacki_endpoint=\"${PT_stacki_endpoint}\""
fi

if [ ! -z "${PT_prim_intf+x}" ];
  then params="${params} prim_intf=\"${PT_prim_intf}\""
fi

if [ ! -z "${PT_stacki_password+x}" ];
  then params="${params} stacki_password=\"${PT_stacki_password}\""
fi

if [ ! -z "${PT_force_install+x}" ];
  then params="${params} force_install=\"${PT_force_install}\""
fi

if [ ! -z "${PT_prim_intf_mac+x}" ];
  then params="${params} prim_intf_mac=\"${PT_prim_intf_mac}\""
fi

ansible localhost -m stacki_host --args "${params}" --one-line | cut -f2- -d">"