#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_node+x}" ];
  then params="${params} node=\"${PT_node}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_cpuunits+x}" ];
  then params="${params} cpuunits=\"${PT_cpuunits}\""
fi

if [ ! -z "${PT_vmid+x}" ];
  then params="${params} vmid=\"${PT_vmid}\""
fi

if [ ! -z "${PT_api_password+x}" ];
  then params="${params} api_password=\"${PT_api_password}\""
fi

if [ ! -z "${PT_cpus+x}" ];
  then params="${params} cpus=\"${PT_cpus}\""
fi

if [ ! -z "${PT_ostemplate+x}" ];
  then params="${params} ostemplate=\"${PT_ostemplate}\""
fi

if [ ! -z "${PT_unprivileged+x}" ];
  then params="${params} unprivileged=\"${PT_unprivileged}\""
fi

if [ ! -z "${PT_disk+x}" ];
  then params="${params} disk=\"${PT_disk}\""
fi

if [ ! -z "${PT_ip_address+x}" ];
  then params="${params} ip_address=\"${PT_ip_address}\""
fi

if [ ! -z "${PT_pool+x}" ];
  then params="${params} pool=\"${PT_pool}\""
fi

if [ ! -z "${PT_api_host+x}" ];
  then params="${params} api_host=\"${PT_api_host}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_searchdomain+x}" ];
  then params="${params} searchdomain=\"${PT_searchdomain}\""
fi

if [ ! -z "${PT_netif+x}" ];
  then params="${params} netif=\"${PT_netif}\""
fi

if [ ! -z "${PT_api_user+x}" ];
  then params="${params} api_user=\"${PT_api_user}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_storage+x}" ];
  then params="${params} storage=\"${PT_storage}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_swap+x}" ];
  then params="${params} swap=\"${PT_swap}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_memory+x}" ];
  then params="${params} memory=\"${PT_memory}\""
fi

if [ ! -z "${PT_mounts+x}" ];
  then params="${params} mounts=\"${PT_mounts}\""
fi

if [ ! -z "${PT_nameserver+x}" ];
  then params="${params} nameserver=\"${PT_nameserver}\""
fi

if [ ! -z "${PT_pubkey+x}" ];
  then params="${params} pubkey=\"${PT_pubkey}\""
fi

if [ ! -z "${PT_onboot+x}" ];
  then params="${params} onboot=\"${PT_onboot}\""
fi

ansible localhost -m proxmox --args "${params}" --one-line | cut -f2- -d">"