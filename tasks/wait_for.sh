#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_active_connection_states+x}" ];
  then params="${params} active_connection_states=\"${PT_active_connection_states}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_connect_timeout+x}" ];
  then params="${params} connect_timeout=\"${PT_connect_timeout}\""
fi

if [ ! -z "${PT_delay+x}" ];
  then params="${params} delay=\"${PT_delay}\""
fi

if [ ! -z "${PT_search_regex+x}" ];
  then params="${params} search_regex=\"${PT_search_regex}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_sleep+x}" ];
  then params="${params} sleep=\"${PT_sleep}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_exclude_hosts+x}" ];
  then params="${params} exclude_hosts=\"${PT_exclude_hosts}\""
fi

if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

ansible localhost -m wait_for --args "${params}" --one-line | cut -f2- -d">"