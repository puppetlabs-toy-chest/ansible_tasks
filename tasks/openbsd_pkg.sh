#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_ports_dir+x}" ];
  then params="${params} ports_dir=\"${PT_ports_dir}\""
fi

if [ ! -z "${PT_clean+x}" ];
  then params="${params} clean=\"${PT_clean}\""
fi

if [ ! -z "${PT_quick+x}" ];
  then params="${params} quick=\"${PT_quick}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_build+x}" ];
  then params="${params} build=\"${PT_build}\""
fi

ansible localhost -m openbsd_pkg --args "${params}" --one-line | cut -f2- -d">"