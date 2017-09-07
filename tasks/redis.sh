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

if [ ! -z "${PT_flush_mode+x}" ];
  then params="${params} flush_mode=\"${PT_flush_mode}\""
fi

if [ ! -z "${PT_master_host+x}" ];
  then params="${params} master_host=\"${PT_master_host}\""
fi

if [ ! -z "${PT_login_host+x}" ];
  then params="${params} login_host=\"${PT_login_host}\""
fi

if [ ! -z "${PT_master_port+x}" ];
  then params="${params} master_port=\"${PT_master_port}\""
fi

if [ ! -z "${PT_db+x}" ];
  then params="${params} db=\"${PT_db}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_slave_mode+x}" ];
  then params="${params} slave_mode=\"${PT_slave_mode}\""
fi

ansible localhost -m redis --args "${params}" --one-line | cut -f2- -d">"