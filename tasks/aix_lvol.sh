#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_pvs+x}" ];
  then params="${params} pvs=\"${PT_pvs}\""
fi

if [ ! -z "${PT_lv_type+x}" ];
  then params="${params} lv_type=\"${PT_lv_type}\""
fi

if [ ! -z "${PT_vg+x}" ];
  then params="${params} vg=\"${PT_vg}\""
fi

if [ ! -z "${PT_copies+x}" ];
  then params="${params} copies=\"${PT_copies}\""
fi

if [ ! -z "${PT_lv+x}" ];
  then params="${params} lv=\"${PT_lv}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_policy+x}" ];
  then params="${params} policy=\"${PT_policy}\""
fi

if [ ! -z "${PT_opts+x}" ];
  then params="${params} opts=\"${PT_opts}\""
fi

if [ ! -z "${PT_size+x}" ];
  then params="${params} size=\"${PT_size}\""
fi

ansible localhost -m aix_lvol --args "${params}" --one-line | cut -f2- -d">"