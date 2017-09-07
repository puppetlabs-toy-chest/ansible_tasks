#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_credential+x}" ];
  then params="${params} credential=\"${PT_credential}\""
fi

if [ ! -z "${PT_use_job_endpoint+x}" ];
  then params="${params} use_job_endpoint=\"${PT_use_job_endpoint}\""
fi

if [ ! -z "${PT_job_template+x}" ];
  then params="${params} job_template=\"${PT_job_template}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_extra_vars+x}" ];
  then params="${params} extra_vars=\"${PT_extra_vars}\""
fi

if [ ! -z "${PT_tower_host+x}" ];
  then params="${params} tower_host=\"${PT_tower_host}\""
fi

if [ ! -z "${PT_job_type+x}" ];
  then params="${params} job_type=\"${PT_job_type}\""
fi

if [ ! -z "${PT_tower_config_file+x}" ];
  then params="${params} tower_config_file=\"${PT_tower_config_file}\""
fi

if [ ! -z "${PT_limit+x}" ];
  then params="${params} limit=\"${PT_limit}\""
fi

if [ ! -z "${PT_inventory+x}" ];
  then params="${params} inventory=\"${PT_inventory}\""
fi

if [ ! -z "${PT_job_explanation+x}" ];
  then params="${params} job_explanation=\"${PT_job_explanation}\""
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

ansible localhost -m tower_job_launch --args "${params}" --one-line | cut -f2- -d">"