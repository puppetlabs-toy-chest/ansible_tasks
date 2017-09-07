#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_min_interval+x}" ];
  then params="${params} min_interval=\"${PT_min_interval}\""
fi

if [ ! -z "${PT_job_id+x}" ];
  then params="${params} job_id=\"${PT_job_id}\""
fi

if [ ! -z "${PT_tower_host+x}" ];
  then params="${params} tower_host=\"${PT_tower_host}\""
fi

if [ ! -z "${PT_tower_config_file+x}" ];
  then params="${params} tower_config_file=\"${PT_tower_config_file}\""
fi

if [ ! -z "${PT_max_interval+x}" ];
  then params="${params} max_interval=\"${PT_max_interval}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_tower_password+x}" ];
  then params="${params} tower_password=\"${PT_tower_password}\""
fi

if [ ! -z "${PT_tower_username+x}" ];
  then params="${params} tower_username=\"${PT_tower_username}\""
fi

if [ ! -z "${PT_tower_verify_ssl+x}" ];
  then params="${params} tower_verify_ssl=\"${PT_tower_verify_ssl}\""
fi

ansible localhost -m tower_job_wait --args "${params}" --one-line | cut -f2- -d">"