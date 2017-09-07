#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_default+x}" ];
  then params="${params} default=\"${PT_default}\""
fi

if [ ! -z "${PT_database_name+x}" ];
  then params="${params} database_name=\"${PT_database_name}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_policy_name+x}" ];
  then params="${params} policy_name=\"${PT_policy_name}\""
fi

if [ ! -z "${PT_replication+x}" ];
  then params="${params} replication=\"${PT_replication}\""
fi

if [ ! -z "${PT_duration+x}" ];
  then params="${params} duration=\"${PT_duration}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

ansible localhost -m influxdb_retention_policy --args "${params}" --one-line | cut -f2- -d">"