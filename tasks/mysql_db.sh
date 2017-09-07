#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_login_port+x}" ];
  then params="${params} login_port=\"${PT_login_port}\""
fi

if [ ! -z "${PT_ssl_cert+x}" ];
  then params="${params} ssl_cert=\"${PT_ssl_cert}\""
fi

if [ ! -z "${PT_config_file+x}" ];
  then params="${params} config_file=\"${PT_config_file}\""
fi

if [ ! -z "${PT_target+x}" ];
  then params="${params} target=\"${PT_target}\""
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

if [ ! -z "${PT_encoding+x}" ];
  then params="${params} encoding=\"${PT_encoding}\""
fi

if [ ! -z "${PT_ssl_ca+x}" ];
  then params="${params} ssl_ca=\"${PT_ssl_ca}\""
fi

if [ ! -z "${PT_login_unix_socket+x}" ];
  then params="${params} login_unix_socket=\"${PT_login_unix_socket}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_collation+x}" ];
  then params="${params} collation=\"${PT_collation}\""
fi

if [ ! -z "${PT_quick+x}" ];
  then params="${params} quick=\"${PT_quick}\""
fi

if [ ! -z "${PT_connect_timeout+x}" ];
  then params="${params} connect_timeout=\"${PT_connect_timeout}\""
fi

if [ ! -z "${PT_single_transaction+x}" ];
  then params="${params} single_transaction=\"${PT_single_transaction}\""
fi

ansible localhost -m mysql_db --args "${params}" --one-line | cut -f2- -d">"