#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_interval+x}" ];
  then params="${params} interval=\"${PT_interval}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_parent+x}" ];
  then params="${params} parent=\"${PT_parent}\""
fi

if [ ! -z "${PT_ip+x}" ];
  then params="${params} ip=\"${PT_ip}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_receive_disable+x}" ];
  then params="${params} receive_disable=\"${PT_receive_disable}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_receive+x}" ];
  then params="${params} receive=\"${PT_receive}\""
fi

if [ ! -z "${PT_partition+x}" ];
  then params="${params} partition=\"${PT_partition}\""
fi

if [ ! -z "${PT_send+x}" ];
  then params="${params} send=\"${PT_send}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_time_until_up+x}" ];
  then params="${params} time_until_up=\"${PT_time_until_up}\""
fi

if [ ! -z "${PT_server_port+x}" ];
  then params="${params} server_port=\"${PT_server_port}\""
fi

if [ ! -z "${PT_parent_partition+x}" ];
  then params="${params} parent_partition=\"${PT_parent_partition}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m bigip_monitor_http --args "${params}" --one-line | cut -f2- -d">"