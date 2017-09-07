#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_dump+x}" ];
  then params="${params} dump=\"${PT_dump}\""
fi

if [ ! -z "${PT_passno+x}" ];
  then params="${params} passno=\"${PT_passno}\""
fi

if [ ! -z "${PT_fstab+x}" ];
  then params="${params} fstab=\"${PT_fstab}\""
fi

if [ ! -z "${PT_boot+x}" ];
  then params="${params} boot=\"${PT_boot}\""
fi

if [ ! -z "${PT_fstype+x}" ];
  then params="${params} fstype=\"${PT_fstype}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_opts+x}" ];
  then params="${params} opts=\"${PT_opts}\""
fi

ansible localhost -m mount --args "${params}" --one-line | cut -f2- -d">"