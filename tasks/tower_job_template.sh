#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_network_credential+x}" ];
  then params="${params} network_credential=\"${PT_network_credential}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_tower_host+x}" ];
  then params="${params} tower_host=\"${PT_tower_host}\""
fi

if [ ! -z "${PT_ask_inventory+x}" ];
  then params="${params} ask_inventory=\"${PT_ask_inventory}\""
fi

if [ ! -z "${PT_job_type+x}" ];
  then params="${params} job_type=\"${PT_job_type}\""
fi

if [ ! -z "${PT_ask_job_type+x}" ];
  then params="${params} ask_job_type=\"${PT_ask_job_type}\""
fi

if [ ! -z "${PT_tower_username+x}" ];
  then params="${params} tower_username=\"${PT_tower_username}\""
fi

if [ ! -z "${PT_skip_tags+x}" ];
  then params="${params} skip_tags=\"${PT_skip_tags}\""
fi

if [ ! -z "${PT_playbook+x}" ];
  then params="${params} playbook=\"${PT_playbook}\""
fi

if [ ! -z "${PT_tower_password+x}" ];
  then params="${params} tower_password=\"${PT_tower_password}\""
fi

if [ ! -z "${PT_tower_config_file+x}" ];
  then params="${params} tower_config_file=\"${PT_tower_config_file}\""
fi

if [ ! -z "${PT_ask_tags+x}" ];
  then params="${params} ask_tags=\"${PT_ask_tags}\""
fi

if [ ! -z "${PT_host_config_key+x}" ];
  then params="${params} host_config_key=\"${PT_host_config_key}\""
fi

if [ ! -z "${PT_machine_credential+x}" ];
  then params="${params} machine_credential=\"${PT_machine_credential}\""
fi

if [ ! -z "${PT_tower_verify_ssl+x}" ];
  then params="${params} tower_verify_ssl=\"${PT_tower_verify_ssl}\""
fi

if [ ! -z "${PT_ask_credential+x}" ];
  then params="${params} ask_credential=\"${PT_ask_credential}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_job_tags+x}" ];
  then params="${params} job_tags=\"${PT_job_tags}\""
fi

if [ ! -z "${PT_verbosity+x}" ];
  then params="${params} verbosity=\"${PT_verbosity}\""
fi

if [ ! -z "${PT_project+x}" ];
  then params="${params} project=\"${PT_project}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_ask_extra_vars+x}" ];
  then params="${params} ask_extra_vars=\"${PT_ask_extra_vars}\""
fi

if [ ! -z "${PT_extra_vars_path+x}" ];
  then params="${params} extra_vars_path=\"${PT_extra_vars_path}\""
fi

if [ ! -z "${PT_inventory+x}" ];
  then params="${params} inventory=\"${PT_inventory}\""
fi

if [ ! -z "${PT_limit+x}" ];
  then params="${params} limit=\"${PT_limit}\""
fi

if [ ! -z "${PT_forks+x}" ];
  then params="${params} forks=\"${PT_forks}\""
fi

if [ ! -z "${PT_cloud_credential+x}" ];
  then params="${params} cloud_credential=\"${PT_cloud_credential}\""
fi

if [ ! -z "${PT_become_enabled+x}" ];
  then params="${params} become_enabled=\"${PT_become_enabled}\""
fi

ansible localhost -m tower_job_template --args "${params}" --one-line | cut -f2- -d">"