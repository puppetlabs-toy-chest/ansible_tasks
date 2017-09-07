#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_windowstyle+x}" ];
  then params="${params} windowstyle=\"${PT_windowstyle}\""
fi

if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_args+x}" ];
  then params="${params} args=\"${PT_args}\""
fi

if [ ! -z "${PT_directory+x}" ];
  then params="${params} directory=\"${PT_directory}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_hotkey+x}" ];
  then params="${params} hotkey=\"${PT_hotkey}\""
fi

if [ ! -z "${PT_icon+x}" ];
  then params="${params} icon=\"${PT_icon}\""
fi

ansible localhost -m win_shortcut --args "${params}" --one-line | cut -f2- -d">"