#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_ssl_rootcert+x}" ];
  then params="${params} ssl_rootcert=\"${PT_ssl_rootcert}\""
fi

if [ ! -z "${PT_ssl_mode+x}" ];
  then params="${params} ssl_mode=\"${PT_ssl_mode}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_login_host+x}" ];
  then params="${params} login_host=\"${PT_login_host}\""
fi

if [ ! -z "${PT_expires+x}" ];
  then params="${params} expires=\"${PT_expires}\""
fi

if [ ! -z "${PT_db+x}" ];
  then params="${params} db=\"${PT_db}\""
fi

if [ ! -z "${PT_login_unix_socket+x}" ];
  then params="${params} login_unix_socket=\"${PT_login_unix_socket}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_fail_on_user+x}" ];
  then params="${params} fail_on_user=\"${PT_fail_on_user}\""
fi

if [ ! -z "${PT_priv+x}" ];
  then params="${params} priv=\"${PT_priv}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_no_password_changes+x}" ];
  then params="${params} no_password_changes=\"${PT_no_password_changes}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_encrypted+x}" ];
  then params="${params} encrypted=\"${PT_encrypted}\""
fi

if [ ! -z "${PT_role_attr_flags+x}" ];
  then params="${params} role_attr_flags=\"${PT_role_attr_flags}\""
fi

ansible localhost -m postgresql_user --args "${params}" --one-line | cut -f2- -d">"