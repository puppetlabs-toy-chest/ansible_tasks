#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_start_mode+x}" ];
  then params="${params} start_mode=\"${PT_start_mode}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_app_parameters_free_form+x}" ];
  then params="${params} app_parameters_free_form=\"${PT_app_parameters_free_form}\""
fi

if [ ! -z "${PT_application+x}" ];
  then params="${params} application=\"${PT_application}\""
fi

if [ ! -z "${PT_stderr_file+x}" ];
  then params="${params} stderr_file=\"${PT_stderr_file}\""
fi

if [ ! -z "${PT_dependencies+x}" ];
  then params="${params} dependencies=\"${PT_dependencies}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_stdout_file+x}" ];
  then params="${params} stdout_file=\"${PT_stdout_file}\""
fi

if [ ! -z "${PT_app_parameters+x}" ];
  then params="${params} app_parameters=\"${PT_app_parameters}\""
fi

ansible localhost -m win_nssm --args "${params}" --one-line | cut -f2- -d">"