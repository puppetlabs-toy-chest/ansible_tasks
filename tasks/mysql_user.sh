#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_login_port+x}" ];
  then params="${params} login_port=\"${PT_login_port}\""
fi

if [ ! -z "${PT_update_password+x}" ];
  then params="${params} update_password=\"${PT_update_password}\""
fi

if [ ! -z "${PT_ssl_cert+x}" ];
  then params="${params} ssl_cert=\"${PT_ssl_cert}\""
fi

if [ ! -z "${PT_config_file+x}" ];
  then params="${params} config_file=\"${PT_config_file}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_ssl_key+x}" ];
  then params="${params} ssl_key=\"${PT_ssl_key}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_login_host+x}" ];
  then params="${params} login_host=\"${PT_login_host}\""
fi

if [ ! -z "${PT_append_privs+x}" ];
  then params="${params} append_privs=\"${PT_append_privs}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_host_all+x}" ];
  then params="${params} host_all=\"${PT_host_all}\""
fi

if [ ! -z "${PT_ssl_ca+x}" ];
  then params="${params} ssl_ca=\"${PT_ssl_ca}\""
fi

if [ ! -z "${PT_login_unix_socket+x}" ];
  then params="${params} login_unix_socket=\"${PT_login_unix_socket}\""
fi

if [ ! -z "${PT_sql_log_bin+x}" ];
  then params="${params} sql_log_bin=\"${PT_sql_log_bin}\""
fi

if [ ! -z "${PT_encrypted+x}" ];
  then params="${params} encrypted=\"${PT_encrypted}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_check_implicit_admin+x}" ];
  then params="${params} check_implicit_admin=\"${PT_check_implicit_admin}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_connect_timeout+x}" ];
  then params="${params} connect_timeout=\"${PT_connect_timeout}\""
fi

if [ ! -z "${PT_priv+x}" ];
  then params="${params} priv=\"${PT_priv}\""
fi

ansible localhost -m mysql_user --args "${params}" --one-line | cut -f2- -d">"