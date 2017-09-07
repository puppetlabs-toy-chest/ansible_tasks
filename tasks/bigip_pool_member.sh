#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_monitor_state+x}" ];
  then params="${params} monitor_state=\"${PT_monitor_state}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_rate_limit+x}" ];
  then params="${params} rate_limit=\"${PT_rate_limit}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_pool+x}" ];
  then params="${params} pool=\"${PT_pool}\""
fi

if [ ! -z "${PT_session_state+x}" ];
  then params="${params} session_state=\"${PT_session_state}\""
fi

if [ ! -z "${PT_ratio+x}" ];
  then params="${params} ratio=\"${PT_ratio}\""
fi

if [ ! -z "${PT_partition+x}" ];
  then params="${params} partition=\"${PT_partition}\""
fi

if [ ! -z "${PT_connection_limit+x}" ];
  then params="${params} connection_limit=\"${PT_connection_limit}\""
fi

if [ ! -z "${PT_preserve_node+x}" ];
  then params="${params} preserve_node=\"${PT_preserve_node}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_server_port+x}" ];
  then params="${params} server_port=\"${PT_server_port}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m bigip_pool_member --args "${params}" --one-line | cut -f2- -d">"