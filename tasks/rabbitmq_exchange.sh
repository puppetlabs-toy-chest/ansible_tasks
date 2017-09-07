#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_login_port+x}" ];
  then params="${params} login_port=\"${PT_login_port}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_login_host+x}" ];
  then params="${params} login_host=\"${PT_login_host}\""
fi

if [ ! -z "${PT_durable+x}" ];
  then params="${params} durable=\"${PT_durable}\""
fi

if [ ! -z "${PT_exchange_type+x}" ];
  then params="${params} exchange_type=\"${PT_exchange_type}\""
fi

if [ ! -z "${PT_vhost+x}" ];
  then params="${params} vhost=\"${PT_vhost}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_internal+x}" ];
  then params="${params} internal=\"${PT_internal}\""
fi

if [ ! -z "${PT_arguments+x}" ];
  then params="${params} arguments=\"${PT_arguments}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_auto_delete+x}" ];
  then params="${params} auto_delete=\"${PT_auto_delete}\""
fi

ansible localhost -m rabbitmq_exchange --args "${params}" --one-line | cut -f2- -d">"