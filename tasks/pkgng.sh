#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_chroot+x}" ];
  then params="${params} chroot=\"${PT_chroot}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_cached+x}" ];
  then params="${params} cached=\"${PT_cached}\""
fi

if [ ! -z "${PT_pkgsite+x}" ];
  then params="${params} pkgsite=\"${PT_pkgsite}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_rootdir+x}" ];
  then params="${params} rootdir=\"${PT_rootdir}\""
fi

if [ ! -z "${PT_autoremove+x}" ];
  then params="${params} autoremove=\"${PT_autoremove}\""
fi

if [ ! -z "${PT_jail+x}" ];
  then params="${params} jail=\"${PT_jail}\""
fi

if [ ! -z "${PT_annotation+x}" ];
  then params="${params} annotation=\"${PT_annotation}\""
fi

ansible localhost -m pkgng --args "${params}" --one-line | cut -f2- -d">"