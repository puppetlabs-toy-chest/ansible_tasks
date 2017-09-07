#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_replicas+x}" ];
  then params="${params} replicas=\"${PT_replicas}\""
fi

if [ ! -z "${PT_bricks+x}" ];
  then params="${params} bricks=\"${PT_bricks}\""
fi

if [ ! -z "${PT_quota+x}" ];
  then params="${params} quota=\"${PT_quota}\""
fi

if [ ! -z "${PT_stripes+x}" ];
  then params="${params} stripes=\"${PT_stripes}\""
fi

if [ ! -z "${PT_cluster+x}" ];
  then params="${params} cluster=\"${PT_cluster}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_arbiter+x}" ];
  then params="${params} arbiter=\"${PT_arbiter}\""
fi

if [ ! -z "${PT_redundancies+x}" ];
  then params="${params} redundancies=\"${PT_redundancies}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_disperses+x}" ];
  then params="${params} disperses=\"${PT_disperses}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_directory+x}" ];
  then params="${params} directory=\"${PT_directory}\""
fi

if [ ! -z "${PT_start_on_create+x}" ];
  then params="${params} start_on_create=\"${PT_start_on_create}\""
fi

if [ ! -z "${PT_rebalance+x}" ];
  then params="${params} rebalance=\"${PT_rebalance}\""
fi

if [ ! -z "${PT_options+x}" ];
  then params="${params} options=\"${PT_options}\""
fi

ansible localhost -m gluster_volume --args "${params}" --one-line | cut -f2- -d">"