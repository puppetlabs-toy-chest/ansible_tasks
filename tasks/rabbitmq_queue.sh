#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_login_port+x}" ];
  then params="${params} login_port=\"${PT_login_port}\""
fi

if [ ! -z "${PT_dead_letter_exchange+x}" ];
  then params="${params} dead_letter_exchange=\"${PT_dead_letter_exchange}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_durable+x}" ];
  then params="${params} durable=\"${PT_durable}\""
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

if [ ! -z "${PT_vhost+x}" ];
  then params="${params} vhost=\"${PT_vhost}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_max_length+x}" ];
  then params="${params} max_length=\"${PT_max_length}\""
fi

if [ ! -z "${PT_arguments+x}" ];
  then params="${params} arguments=\"${PT_arguments}\""
fi

if [ ! -z "${PT_message_ttl+x}" ];
  then params="${params} message_ttl=\"${PT_message_ttl}\""
fi

if [ ! -z "${PT_auto_expires+x}" ];
  then params="${params} auto_expires=\"${PT_auto_expires}\""
fi

if [ ! -z "${PT_dead_letter_routing_key+x}" ];
  then params="${params} dead_letter_routing_key=\"${PT_dead_letter_routing_key}\""
fi

if [ ! -z "${PT_auto_delete+x}" ];
  then params="${params} auto_delete=\"${PT_auto_delete}\""
fi

ansible localhost -m rabbitmq_queue --args "${params}" --one-line | cut -f2- -d">"