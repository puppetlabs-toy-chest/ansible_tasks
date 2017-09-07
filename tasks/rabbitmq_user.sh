#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_node+x}" ];
  then params="${params} node=\"${PT_node}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_read_priv+x}" ];
  then params="${params} read_priv=\"${PT_read_priv}\""
fi

if [ ! -z "${PT_write_priv+x}" ];
  then params="${params} write_priv=\"${PT_write_priv}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_configure_priv+x}" ];
  then params="${params} configure_priv=\"${PT_configure_priv}\""
fi

if [ ! -z "${PT_vhost+x}" ];
  then params="${params} vhost=\"${PT_vhost}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_permissions+x}" ];
  then params="${params} permissions=\"${PT_permissions}\""
fi

ansible localhost -m rabbitmq_user --args "${params}" --one-line | cut -f2- -d">"