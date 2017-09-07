#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_ssl_key+x}" ];
  then params="${params} ssl_key=\"${PT_ssl_key}\""
fi

if [ ! -z "${PT_master_auto_position+x}" ];
  then params="${params} master_auto_position=\"${PT_master_auto_position}\""
fi

if [ ! -z "${PT_config_file+x}" ];
  then params="${params} config_file=\"${PT_config_file}\""
fi

if [ ! -z "${PT_master_ssl_cert+x}" ];
  then params="${params} master_ssl_cert=\"${PT_master_ssl_cert}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_login_host+x}" ];
  then params="${params} login_host=\"${PT_login_host}\""
fi

if [ ! -z "${PT_master_port+x}" ];
  then params="${params} master_port=\"${PT_master_port}\""
fi

if [ ! -z "${PT_master_host+x}" ];
  then params="${params} master_host=\"${PT_master_host}\""
fi

if [ ! -z "${PT_master_ssl_ca+x}" ];
  then params="${params} master_ssl_ca=\"${PT_master_ssl_ca}\""
fi

if [ ! -z "${PT_login_unix_socket+x}" ];
  then params="${params} login_unix_socket=\"${PT_login_unix_socket}\""
fi

if [ ! -z "${PT_master_connect_retry+x}" ];
  then params="${params} master_connect_retry=\"${PT_master_connect_retry}\""
fi

if [ ! -z "${PT_master_user+x}" ];
  then params="${params} master_user=\"${PT_master_user}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_master_log_file+x}" ];
  then params="${params} master_log_file=\"${PT_master_log_file}\""
fi

if [ ! -z "${PT_master_ssl_cipher+x}" ];
  then params="${params} master_ssl_cipher=\"${PT_master_ssl_cipher}\""
fi

if [ ! -z "${PT_master_password+x}" ];
  then params="${params} master_password=\"${PT_master_password}\""
fi

if [ ! -z "${PT_relay_log_file+x}" ];
  then params="${params} relay_log_file=\"${PT_relay_log_file}\""
fi

if [ ! -z "${PT_login_port+x}" ];
  then params="${params} login_port=\"${PT_login_port}\""
fi

if [ ! -z "${PT_ssl_cert+x}" ];
  then params="${params} ssl_cert=\"${PT_ssl_cert}\""
fi

if [ ! -z "${PT_master_ssl+x}" ];
  then params="${params} master_ssl=\"${PT_master_ssl}\""
fi

if [ ! -z "${PT_ssl_ca+x}" ];
  then params="${params} ssl_ca=\"${PT_ssl_ca}\""
fi

if [ ! -z "${PT_master_ssl_key+x}" ];
  then params="${params} master_ssl_key=\"${PT_master_ssl_key}\""
fi

if [ ! -z "${PT_master_ssl_capath+x}" ];
  then params="${params} master_ssl_capath=\"${PT_master_ssl_capath}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_master_log_pos+x}" ];
  then params="${params} master_log_pos=\"${PT_master_log_pos}\""
fi

if [ ! -z "${PT_connect_timeout+x}" ];
  then params="${params} connect_timeout=\"${PT_connect_timeout}\""
fi

if [ ! -z "${PT_relay_log_pos+x}" ];
  then params="${params} relay_log_pos=\"${PT_relay_log_pos}\""
fi

ansible localhost -m mysql_replication --args "${params}" --one-line | cut -f2- -d">"