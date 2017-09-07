#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_dsfield+x}" ];
  then params="${params} dsfield=\"${PT_dsfield}\""
fi

if [ ! -z "${PT_temporary+x}" ];
  then params="${params} temporary=\"${PT_temporary}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_maxbw+x}" ];
  then params="${params} maxbw=\"${PT_maxbw}\""
fi

if [ ! -z "${PT_local_port+x}" ];
  then params="${params} local_port=\"${PT_local_port}\""
fi

if [ ! -z "${PT_local_ip+x}" ];
  then params="${params} local_ip=\"${PT_local_ip}\""
fi

if [ ! -z "${PT_remove_ip+x}" ];
  then params="${params} remove_ip=\"${PT_remove_ip}\""
fi

if [ ! -z "${PT_priority+x}" ];
  then params="${params} priority=\"${PT_priority}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_link+x}" ];
  then params="${params} link=\"${PT_link}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

ansible localhost -m flowadm --args "${params}" --one-line | cut -f2- -d">"