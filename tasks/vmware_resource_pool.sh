#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_resource_pool+x}" ];
  then params="${params} resource_pool=\"${PT_resource_pool}\""
fi

if [ ! -z "${PT_cpu_reservation+x}" ];
  then params="${params} cpu_reservation=\"${PT_cpu_reservation}\""
fi

if [ ! -z "${PT_cluster+x}" ];
  then params="${params} cluster=\"${PT_cluster}\""
fi

if [ ! -z "${PT_cpu_expandable_reservations+x}" ];
  then params="${params} cpu_expandable_reservations=\"${PT_cpu_expandable_reservations}\""
fi

if [ ! -z "${PT_cpu_limit+x}" ];
  then params="${params} cpu_limit=\"${PT_cpu_limit}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_datacenter+x}" ];
  then params="${params} datacenter=\"${PT_datacenter}\""
fi

if [ ! -z "${PT_mem_expandable_reservations+x}" ];
  then params="${params} mem_expandable_reservations=\"${PT_mem_expandable_reservations}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_mem_shares+x}" ];
  then params="${params} mem_shares=\"${PT_mem_shares}\""
fi

if [ ! -z "${PT_mem_limit+x}" ];
  then params="${params} mem_limit=\"${PT_mem_limit}\""
fi

if [ ! -z "${PT_mem_reservation+x}" ];
  then params="${params} mem_reservation=\"${PT_mem_reservation}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_cpu_shares+x}" ];
  then params="${params} cpu_shares=\"${PT_cpu_shares}\""
fi

ansible localhost -m vmware_resource_pool --args "${params}" --one-line | cut -f2- -d">"