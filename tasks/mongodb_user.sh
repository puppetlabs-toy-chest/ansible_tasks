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

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_roles+x}" ];
  then params="${params} roles=\"${PT_roles}\""
fi

if [ ! -z "${PT_database+x}" ];
  then params="${params} database=\"${PT_database}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_login_host+x}" ];
  then params="${params} login_host=\"${PT_login_host}\""
fi

if [ ! -z "${PT_login_database+x}" ];
  then params="${params} login_database=\"${PT_login_database}\""
fi

if [ ! -z "${PT_ssl_cert_reqs+x}" ];
  then params="${params} ssl_cert_reqs=\"${PT_ssl_cert_reqs}\""
fi

if [ ! -z "${PT_ssl+x}" ];
  then params="${params} ssl=\"${PT_ssl}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_replica_set+x}" ];
  then params="${params} replica_set=\"${PT_replica_set}\""
fi

ansible localhost -m mongodb_user --args "${params}" --one-line | cut -f2- -d">"