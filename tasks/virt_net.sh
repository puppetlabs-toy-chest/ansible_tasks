#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_xml+x}" ];
  then params="${params} xml=\"${PT_xml}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_autostart+x}" ];
  then params="${params} autostart=\"${PT_autostart}\""
fi

if [ ! -z "${PT_uri+x}" ];
  then params="${params} uri=\"${PT_uri}\""
fi

ansible localhost -m virt_net --args "${params}" --one-line | cut -f2- -d">"