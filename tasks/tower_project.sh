#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_scm_branch+x}" ];
  then params="${params} scm_branch=\"${PT_scm_branch}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_tower_host+x}" ];
  then params="${params} tower_host=\"${PT_tower_host}\""
fi

if [ ! -z "${PT_scm_update_on_launch+x}" ];
  then params="${params} scm_update_on_launch=\"${PT_scm_update_on_launch}\""
fi

if [ ! -z "${PT_scm_clean+x}" ];
  then params="${params} scm_clean=\"${PT_scm_clean}\""
fi

if [ ! -z "${PT_scm_type+x}" ];
  then params="${params} scm_type=\"${PT_scm_type}\""
fi

if [ ! -z "${PT_scm_delete_on_update+x}" ];
  then params="${params} scm_delete_on_update=\"${PT_scm_delete_on_update}\""
fi

if [ ! -z "${PT_tower_username+x}" ];
  then params="${params} tower_username=\"${PT_tower_username}\""
fi

if [ ! -z "${PT_tower_password+x}" ];
  then params="${params} tower_password=\"${PT_tower_password}\""
fi

if [ ! -z "${PT_tower_config_file+x}" ];
  then params="${params} tower_config_file=\"${PT_tower_config_file}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_tower_verify_ssl+x}" ];
  then params="${params} tower_verify_ssl=\"${PT_tower_verify_ssl}\""
fi

if [ ! -z "${PT_scm_credential+x}" ];
  then params="${params} scm_credential=\"${PT_scm_credential}\""
fi

if [ ! -z "${PT_scm_url+x}" ];
  then params="${params} scm_url=\"${PT_scm_url}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_local_path+x}" ];
  then params="${params} local_path=\"${PT_local_path}\""
fi

if [ ! -z "${PT_organization+x}" ];
  then params="${params} organization=\"${PT_organization}\""
fi

ansible localhost -m tower_project --args "${params}" --one-line | cut -f2- -d">"