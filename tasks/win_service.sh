#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_display_name+x}" ];
  then params="${params} display_name=\"${PT_display_name}\""
fi

if [ ! -z "${PT_desktop_interact+x}" ];
  then params="${params} desktop_interact=\"${PT_desktop_interact}\""
fi

if [ ! -z "${PT_force_dependent_services+x}" ];
  then params="${params} force_dependent_services=\"${PT_force_dependent_services}\""
fi

if [ ! -z "${PT_dependency_action+x}" ];
  then params="${params} dependency_action=\"${PT_dependency_action}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_start_mode+x}" ];
  then params="${params} start_mode=\"${PT_start_mode}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_dependencies+x}" ];
  then params="${params} dependencies=\"${PT_dependencies}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

ansible localhost -m win_service --args "${params}" --one-line | cut -f2- -d">"