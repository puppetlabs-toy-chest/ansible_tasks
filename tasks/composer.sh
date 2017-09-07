#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_no_scripts+x}" ];
  then params="${params} no_scripts=\"${PT_no_scripts}\""
fi

if [ ! -z "${PT_arguments+x}" ];
  then params="${params} arguments=\"${PT_arguments}\""
fi

if [ ! -z "${PT_prefer_dist+x}" ];
  then params="${params} prefer_dist=\"${PT_prefer_dist}\""
fi

if [ ! -z "${PT_working_dir+x}" ];
  then params="${params} working_dir=\"${PT_working_dir}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_global_command+x}" ];
  then params="${params} global_command=\"${PT_global_command}\""
fi

if [ ! -z "${PT_prefer_source+x}" ];
  then params="${params} prefer_source=\"${PT_prefer_source}\""
fi

if [ ! -z "${PT_ignore_platform_reqs+x}" ];
  then params="${params} ignore_platform_reqs=\"${PT_ignore_platform_reqs}\""
fi

if [ ! -z "${PT_no_dev+x}" ];
  then params="${params} no_dev=\"${PT_no_dev}\""
fi

if [ ! -z "${PT_no_plugins+x}" ];
  then params="${params} no_plugins=\"${PT_no_plugins}\""
fi

if [ ! -z "${PT_optimize_autoloader+x}" ];
  then params="${params} optimize_autoloader=\"${PT_optimize_autoloader}\""
fi

ansible localhost -m composer --args "${params}" --one-line | cut -f2- -d">"