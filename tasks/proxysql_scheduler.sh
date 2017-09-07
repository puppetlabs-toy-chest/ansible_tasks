#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_config_file+x}" ];
  then params="${params} config_file=\"${PT_config_file}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_arg2+x}" ];
  then params="${params} arg2=\"${PT_arg2}\""
fi

if [ ! -z "${PT_arg3+x}" ];
  then params="${params} arg3=\"${PT_arg3}\""
fi

if [ ! -z "${PT_arg4+x}" ];
  then params="${params} arg4=\"${PT_arg4}\""
fi

if [ ! -z "${PT_arg5+x}" ];
  then params="${params} arg5=\"${PT_arg5}\""
fi

if [ ! -z "${PT_interval_ms+x}" ];
  then params="${params} interval_ms=\"${PT_interval_ms}\""
fi

if [ ! -z "${PT_load_to_runtime+x}" ];
  then params="${params} load_to_runtime=\"${PT_load_to_runtime}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_active+x}" ];
  then params="${params} active=\"${PT_active}\""
fi

if [ ! -z "${PT_login_port+x}" ];
  then params="${params} login_port=\"${PT_login_port}\""
fi

if [ ! -z "${PT_force_delete+x}" ];
  then params="${params} force_delete=\"${PT_force_delete}\""
fi

if [ ! -z "${PT_save_to_disk+x}" ];
  then params="${params} save_to_disk=\"${PT_save_to_disk}\""
fi

if [ ! -z "${PT_filename+x}" ];
  then params="${params} filename=\"${PT_filename}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_arg1+x}" ];
  then params="${params} arg1=\"${PT_arg1}\""
fi

if [ ! -z "${PT_login_host+x}" ];
  then params="${params} login_host=\"${PT_login_host}\""
fi

ansible localhost -m proxysql_scheduler --args "${params}" --one-line | cut -f2- -d">"