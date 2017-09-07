#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_control+x}" ];
  then params="${params} control=\"${PT_control}\""
fi

if [ ! -z "${PT_new_module_path+x}" ];
  then params="${params} new_module_path=\"${PT_new_module_path}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_new_type+x}" ];
  then params="${params} new_type=\"${PT_new_type}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_new_control+x}" ];
  then params="${params} new_control=\"${PT_new_control}\""
fi

if [ ! -z "${PT_module_path+x}" ];
  then params="${params} module_path=\"${PT_module_path}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_module_arguments+x}" ];
  then params="${params} module_arguments=\"${PT_module_arguments}\""
fi

ansible localhost -m pamd --args "${params}" --one-line | cut -f2- -d">"