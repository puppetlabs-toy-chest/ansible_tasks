#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_default_hostgroup+x}" ];
  then params="${params} default_hostgroup=\"${PT_default_hostgroup}\""
fi

if [ ! -z "${PT_frontend+x}" ];
  then params="${params} frontend=\"${PT_frontend}\""
fi

if [ ! -z "${PT_default_schema+x}" ];
  then params="${params} default_schema=\"${PT_default_schema}\""
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

if [ ! -z "${PT_fast_forward+x}" ];
  then params="${params} fast_forward=\"${PT_fast_forward}\""
fi

if [ ! -z "${PT_load_to_runtime+x}" ];
  then params="${params} load_to_runtime=\"${PT_load_to_runtime}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_active+x}" ];
  then params="${params} active=\"${PT_active}\""
fi

if [ ! -z "${PT_config_file+x}" ];
  then params="${params} config_file=\"${PT_config_file}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_max_connections+x}" ];
  then params="${params} max_connections=\"${PT_max_connections}\""
fi

if [ ! -z "${PT_login_port+x}" ];
  then params="${params} login_port=\"${PT_login_port}\""
fi

if [ ! -z "${PT_transaction_persistent+x}" ];
  then params="${params} transaction_persistent=\"${PT_transaction_persistent}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_backend+x}" ];
  then params="${params} backend=\"${PT_backend}\""
fi

ansible localhost -m proxysql_mysql_users --args "${params}" --one-line | cut -f2- -d">"