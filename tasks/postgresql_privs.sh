#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_objs+x}" ];
  then params="${params} objs=\"${PT_objs}\""
fi

if [ ! -z "${PT_ssl_rootcert+x}" ];
  then params="${params} ssl_rootcert=\"${PT_ssl_rootcert}\""
fi

if [ ! -z "${PT_ssl_mode+x}" ];
  then params="${params} ssl_mode=\"${PT_ssl_mode}\""
fi

if [ ! -z "${PT_roles+x}" ];
  then params="${params} roles=\"${PT_roles}\""
fi

if [ ! -z "${PT_privs+x}" ];
  then params="${params} privs=\"${PT_privs}\""
fi

if [ ! -z "${PT_database+x}" ];
  then params="${params} database=\"${PT_database}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_unix_socket+x}" ];
  then params="${params} unix_socket=\"${PT_unix_socket}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_login+x}" ];
  then params="${params} login=\"${PT_login}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_grant_option+x}" ];
  then params="${params} grant_option=\"${PT_grant_option}\""
fi

if [ ! -z "${PT_schema+x}" ];
  then params="${params} schema=\"${PT_schema}\""
fi

ansible localhost -m postgresql_privs --args "${params}" --one-line | cut -f2- -d">"