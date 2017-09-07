#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_pvs+x}" ];
  then params="${params} pvs=\"${PT_pvs}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_vg+x}" ];
  then params="${params} vg=\"${PT_vg}\""
fi

if [ ! -z "${PT_lv+x}" ];
  then params="${params} lv=\"${PT_lv}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_snapshot+x}" ];
  then params="${params} snapshot=\"${PT_snapshot}\""
fi

if [ ! -z "${PT_active+x}" ];
  then params="${params} active=\"${PT_active}\""
fi

if [ ! -z "${PT_shrink+x}" ];
  then params="${params} shrink=\"${PT_shrink}\""
fi

if [ ! -z "${PT_opts+x}" ];
  then params="${params} opts=\"${PT_opts}\""
fi

if [ ! -z "${PT_size+x}" ];
  then params="${params} size=\"${PT_size}\""
fi

ansible localhost -m lvol --args "${params}" --one-line | cut -f2- -d">"