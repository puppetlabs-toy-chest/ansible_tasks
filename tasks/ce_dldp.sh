#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_reset+x}" ];
  then params="${params} reset=\"${PT_reset}\""
fi

if [ ! -z "${PT_enable+x}" ];
  then params="${params} enable=\"${PT_enable}\""
fi

if [ ! -z "${PT_work_mode+x}" ];
  then params="${params} work_mode=\"${PT_work_mode}\""
fi

if [ ! -z "${PT_auth_pwd+x}" ];
  then params="${params} auth_pwd=\"${PT_auth_pwd}\""
fi

if [ ! -z "${PT_time_internal+x}" ];
  then params="${params} time_internal=\"${PT_time_internal}\""
fi

if [ ! -z "${PT_auth_mode+x}" ];
  then params="${params} auth_mode=\"${PT_auth_mode}\""
fi

ansible localhost -m ce_dldp --args "${params}" --one-line | cut -f2- -d">"