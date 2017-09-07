#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_executable+x}" ];
  then params="${params} executable=\"${PT_executable}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_enabled+x}" ];
  then params="${params} enabled=\"${PT_enabled}\""
fi

if [ ! -z "${PT_days_of_week+x}" ];
  then params="${params} days_of_week=\"${PT_days_of_week}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_frequency+x}" ];
  then params="${params} frequency=\"${PT_frequency}\""
fi

if [ ! -z "${PT_arguments+x}" ];
  then params="${params} arguments=\"${PT_arguments}\""
fi

if [ ! -z "${PT_time+x}" ];
  then params="${params} time=\"${PT_time}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

ansible localhost -m win_scheduled_task --args "${params}" --one-line | cut -f2- -d">"