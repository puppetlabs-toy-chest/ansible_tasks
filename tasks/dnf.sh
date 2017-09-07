#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_autoremove+x}" ];
  then params="${params} autoremove=\"${PT_autoremove}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_list+x}" ];
  then params="${params} list=\"${PT_list}\""
fi

if [ ! -z "${PT_disable_gpg_check+x}" ];
  then params="${params} disable_gpg_check=\"${PT_disable_gpg_check}\""
fi

if [ ! -z "${PT_conf_file+x}" ];
  then params="${params} conf_file=\"${PT_conf_file}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_disablerepo+x}" ];
  then params="${params} disablerepo=\"${PT_disablerepo}\""
fi

if [ ! -z "${PT_enablerepo+x}" ];
  then params="${params} enablerepo=\"${PT_enablerepo}\""
fi

if [ ! -z "${PT_installroot+x}" ];
  then params="${params} installroot=\"${PT_installroot}\""
fi

ansible localhost -m dnf --args "${params}" --one-line | cut -f2- -d">"