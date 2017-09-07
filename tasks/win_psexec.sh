#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_limited+x}" ];
  then params="${params} limited=\"${PT_limited}\""
fi

if [ ! -z "${PT_executable+x}" ];
  then params="${params} executable=\"${PT_executable}\""
fi

if [ ! -z "${PT_chdir+x}" ];
  then params="${params} chdir=\"${PT_chdir}\""
fi

if [ ! -z "${PT_interactive+x}" ];
  then params="${params} interactive=\"${PT_interactive}\""
fi

if [ ! -z "${PT_noprofile+x}" ];
  then params="${params} noprofile=\"${PT_noprofile}\""
fi

if [ ! -z "${PT_system+x}" ];
  then params="${params} system=\"${PT_system}\""
fi

if [ ! -z "${PT_elevated+x}" ];
  then params="${params} elevated=\"${PT_elevated}\""
fi

if [ ! -z "${PT_priority+x}" ];
  then params="${params} priority=\"${PT_priority}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_hostnames+x}" ];
  then params="${params} hostnames=\"${PT_hostnames}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_nobanner+x}" ];
  then params="${params} nobanner=\"${PT_nobanner}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

ansible localhost -m win_psexec --args "${params}" --one-line | cut -f2- -d">"