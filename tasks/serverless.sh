#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_functions+x}" ];
  then params="${params} functions=\"${PT_functions}\""
fi

if [ ! -z "${PT_deploy+x}" ];
  then params="${params} deploy=\"${PT_deploy}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_stage+x}" ];
  then params="${params} stage=\"${PT_stage}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_service_path+x}" ];
  then params="${params} service_path=\"${PT_service_path}\""
fi

ansible localhost -m serverless --args "${params}" --one-line | cut -f2- -d">"