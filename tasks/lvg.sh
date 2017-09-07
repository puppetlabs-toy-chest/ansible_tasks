#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_vg_options+x}" ];
  then params="${params} vg_options=\"${PT_vg_options}\""
fi

if [ ! -z "${PT_pvs+x}" ];
  then params="${params} pvs=\"${PT_pvs}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_vg+x}" ];
  then params="${params} vg=\"${PT_vg}\""
fi

if [ ! -z "${PT_pesize+x}" ];
  then params="${params} pesize=\"${PT_pesize}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

ansible localhost -m lvg --args "${params}" --one-line | cut -f2- -d">"