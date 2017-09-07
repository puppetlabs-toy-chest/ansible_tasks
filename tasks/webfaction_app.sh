#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_port_open+x}" ];
  then params="${params} port_open=\"${PT_port_open}\""
fi

if [ ! -z "${PT_machine+x}" ];
  then params="${params} machine=\"${PT_machine}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_autostart+x}" ];
  then params="${params} autostart=\"${PT_autostart}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_login_name+x}" ];
  then params="${params} login_name=\"${PT_login_name}\""
fi

if [ ! -z "${PT_extra_info+x}" ];
  then params="${params} extra_info=\"${PT_extra_info}\""
fi

ansible localhost -m webfaction_app --args "${params}" --one-line | cut -f2- -d">"