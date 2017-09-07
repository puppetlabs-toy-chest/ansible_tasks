#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_files+x}" ];
  then params="${params} files=\"${PT_files}\""
fi

if [ ! -z "${PT_key_name+x}" ];
  then params="${params} key_name=\"${PT_key_name}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_user_data+x}" ];
  then params="${params} user_data=\"${PT_user_data}\""
fi

if [ ! -z "${PT_min_entities+x}" ];
  then params="${params} min_entities=\"${PT_min_entities}\""
fi

if [ ! -z "${PT_verify_ssl+x}" ];
  then params="${params} verify_ssl=\"${PT_verify_ssl}\""
fi

if [ ! -z "${PT_cooldown+x}" ];
  then params="${params} cooldown=\"${PT_cooldown}\""
fi

if [ ! -z "${PT_meta+x}" ];
  then params="${params} meta=\"${PT_meta}\""
fi

if [ ! -z "${PT_credentials+x}" ];
  then params="${params} credentials=\"${PT_credentials}\""
fi

if [ ! -z "${PT_flavor+x}" ];
  then params="${params} flavor=\"${PT_flavor}\""
fi

if [ ! -z "${PT_networks+x}" ];
  then params="${params} networks=\"${PT_networks}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_max_entities+x}" ];
  then params="${params} max_entities=\"${PT_max_entities}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_server_name+x}" ];
  then params="${params} server_name=\"${PT_server_name}\""
fi

if [ ! -z "${PT_loadbalancers+x}" ];
  then params="${params} loadbalancers=\"${PT_loadbalancers}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_disk_config+x}" ];
  then params="${params} disk_config=\"${PT_disk_config}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_env+x}" ];
  then params="${params} env=\"${PT_env}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_config_drive+x}" ];
  then params="${params} config_drive=\"${PT_config_drive}\""
fi

ansible localhost -m rax_scaling_group --args "${params}" --one-line | cut -f2- -d">"