#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_remoteport+x}" ];
  then params="${params} remoteport=\"${PT_remoteport}\""
fi

if [ ! -z "${PT_direction+x}" ];
  then params="${params} direction=\"${PT_direction}\""
fi

if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_service+x}" ];
  then params="${params} service=\"${PT_service}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_enabled+x}" ];
  then params="${params} enabled=\"${PT_enabled}\""
fi

if [ ! -z "${PT_profiles+x}" ];
  then params="${params} profiles=\"${PT_profiles}\""
fi

if [ ! -z "${PT_localip+x}" ];
  then params="${params} localip=\"${PT_localip}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_program+x}" ];
  then params="${params} program=\"${PT_program}\""
fi

if [ ! -z "${PT_remoteip+x}" ];
  then params="${params} remoteip=\"${PT_remoteip}\""
fi

if [ ! -z "${PT_action+x}" ];
  then params="${params} action=\"${PT_action}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_localport+x}" ];
  then params="${params} localport=\"${PT_localport}\""
fi

ansible localhost -m win_firewall_rule --args "${params}" --one-line | cut -f2- -d">"