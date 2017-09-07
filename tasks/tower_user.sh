#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_superuser+x}" ];
  then params="${params} superuser=\"${PT_superuser}\""
fi

if [ ! -z "${PT_first_name+x}" ];
  then params="${params} first_name=\"${PT_first_name}\""
fi

if [ ! -z "${PT_last_name+x}" ];
  then params="${params} last_name=\"${PT_last_name}\""
fi

if [ ! -z "${PT_tower_host+x}" ];
  then params="${params} tower_host=\"${PT_tower_host}\""
fi

if [ ! -z "${PT_email+x}" ];
  then params="${params} email=\"${PT_email}\""
fi

if [ ! -z "${PT_tower_username+x}" ];
  then params="${params} tower_username=\"${PT_tower_username}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_auditor+x}" ];
  then params="${params} auditor=\"${PT_auditor}\""
fi

if [ ! -z "${PT_tower_password+x}" ];
  then params="${params} tower_password=\"${PT_tower_password}\""
fi

if [ ! -z "${PT_tower_config_file+x}" ];
  then params="${params} tower_config_file=\"${PT_tower_config_file}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tower_verify_ssl+x}" ];
  then params="${params} tower_verify_ssl=\"${PT_tower_verify_ssl}\""
fi

ansible localhost -m tower_user --args "${params}" --one-line | cut -f2- -d">"