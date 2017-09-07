#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_application+x}" ];
  then params="${params} application=\"${PT_application}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_physical_path+x}" ];
  then params="${params} physical_path=\"${PT_physical_path}\""
fi

if [ ! -z "${PT_site+x}" ];
  then params="${params} site=\"${PT_site}\""
fi

ansible localhost -m win_iis_virtualdirectory --args "${params}" --one-line | cut -f2- -d">"