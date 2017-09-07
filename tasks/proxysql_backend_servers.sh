#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_status+x}" ];
  then params="${params} status=\"${PT_status}\""
fi

if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_config_file+x}" ];
  then params="${params} config_file=\"${PT_config_file}\""
fi

if [ ! -z "${PT_weight+x}" ];
  then params="${params} weight=\"${PT_weight}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_login_host+x}" ];
  then params="${params} login_host=\"${PT_login_host}\""
fi

if [ ! -z "${PT_save_to_disk+x}" ];
  then params="${params} save_to_disk=\"${PT_save_to_disk}\""
fi

if [ ! -z "${PT_load_to_runtime+x}" ];
  then params="${params} load_to_runtime=\"${PT_load_to_runtime}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_max_connections+x}" ];
  then params="${params} max_connections=\"${PT_max_connections}\""
fi

if [ ! -z "${PT_login_port+x}" ];
  then params="${params} login_port=\"${PT_login_port}\""
fi

if [ ! -z "${PT_compression+x}" ];
  then params="${params} compression=\"${PT_compression}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_hostgroup_id+x}" ];
  then params="${params} hostgroup_id=\"${PT_hostgroup_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_max_latency_ms+x}" ];
  then params="${params} max_latency_ms=\"${PT_max_latency_ms}\""
fi

if [ ! -z "${PT_max_replication_lag+x}" ];
  then params="${params} max_replication_lag=\"${PT_max_replication_lag}\""
fi

ansible localhost -m proxysql_backend_servers --args "${params}" --one-line | cut -f2- -d">"