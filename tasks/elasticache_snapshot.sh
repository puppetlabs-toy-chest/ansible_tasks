#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_replication_id+x}" ];
  then params="${params} replication_id=\"${PT_replication_id}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_cluster_id+x}" ];
  then params="${params} cluster_id=\"${PT_cluster_id}\""
fi

if [ ! -z "${PT_bucket+x}" ];
  then params="${params} bucket=\"${PT_bucket}\""
fi

if [ ! -z "${PT_target+x}" ];
  then params="${params} target=\"${PT_target}\""
fi

ansible localhost -m elasticache_snapshot --args "${params}" --one-line | cut -f2- -d">"