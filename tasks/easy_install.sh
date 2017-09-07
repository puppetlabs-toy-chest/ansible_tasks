#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_virtualenv+x}" ];
  then params="${params} virtualenv=\"${PT_virtualenv}\""
fi

if [ ! -z "${PT_virtualenv_site_packages+x}" ];
  then params="${params} virtualenv_site_packages=\"${PT_virtualenv_site_packages}\""
fi

if [ ! -z "${PT_virtualenv_command+x}" ];
  then params="${params} virtualenv_command=\"${PT_virtualenv_command}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_executable+x}" ];
  then params="${params} executable=\"${PT_executable}\""
fi

ansible localhost -m easy_install --args "${params}" --one-line | cut -f2- -d">"