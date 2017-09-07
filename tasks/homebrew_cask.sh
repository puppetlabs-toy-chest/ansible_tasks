#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_update_homebrew+x}" ];
  then params="${params} update_homebrew=\"${PT_update_homebrew}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_install_options+x}" ];
  then params="${params} install_options=\"${PT_install_options}\""
fi

ansible localhost -m homebrew_cask --args "${params}" --one-line | cut -f2- -d">"