#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_login_port+x}" ];
  then params="${params} login_port=\"${PT_login_port}\""
fi

if [ ! -z "${PT_config_file+x}" ];
  then params="${params} config_file=\"${PT_config_file}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_login_host+x}" ];
  then params="${params} login_host=\"${PT_login_host}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

if [ ! -z "${PT_load_to_runtime+x}" ];
  then params="${params} load_to_runtime=\"${PT_load_to_runtime}\""
fi

if [ ! -z "${PT_save_to_disk+x}" ];
  then params="${params} save_to_disk=\"${PT_save_to_disk}\""
fi

if [ ! -z "${PT_variable+x}" ];
  then params="${params} variable=\"${PT_variable}\""
fi

ansible localhost -m proxysql_global_variables --args "${params}" --one-line | cut -f2- -d">"