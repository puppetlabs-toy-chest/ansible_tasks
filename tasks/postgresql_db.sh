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

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_lc_collate+x}" ];
  then params="${params} lc_collate=\"${PT_lc_collate}\""
fi

if [ ! -z "${PT_encoding+x}" ];
  then params="${params} encoding=\"${PT_encoding}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_login_host+x}" ];
  then params="${params} login_host=\"${PT_login_host}\""
fi

if [ ! -z "${PT_lc_ctype+x}" ];
  then params="${params} lc_ctype=\"${PT_lc_ctype}\""
fi

if [ ! -z "${PT_login_unix_socket+x}" ];
  then params="${params} login_unix_socket=\"${PT_login_unix_socket}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_template+x}" ];
  then params="${params} template=\"${PT_template}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_owner+x}" ];
  then params="${params} owner=\"${PT_owner}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

ansible localhost -m postgresql_db --args "${params}" --one-line | cut -f2- -d">"