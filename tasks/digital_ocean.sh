#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_unique_name+x}" ];
  then params="${params} unique_name=\"${PT_unique_name}\""
fi

if [ ! -z "${PT_virtio+x}" ];
  then params="${params} virtio=\"${PT_virtio}\""
fi

if [ ! -z "${PT_region_id+x}" ];
  then params="${params} region_id=\"${PT_region_id}\""
fi

if [ ! -z "${PT_backups_enabled+x}" ];
  then params="${params} backups_enabled=\"${PT_backups_enabled}\""
fi

if [ ! -z "${PT_user_data+x}" ];
  then params="${params} user_data=\"${PT_user_data}\""
fi

if [ ! -z "${PT_image_id+x}" ];
  then params="${params} image_id=\"${PT_image_id}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_api_token+x}" ];
  then params="${params} api_token=\"${PT_api_token}\""
fi

if [ ! -z "${PT_ssh_pub_key+x}" ];
  then params="${params} ssh_pub_key=\"${PT_ssh_pub_key}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_size_id+x}" ];
  then params="${params} size_id=\"${PT_size_id}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_ssh_key_ids+x}" ];
  then params="${params} ssh_key_ids=\"${PT_ssh_key_ids}\""
fi

if [ ! -z "${PT_ipv6+x}" ];
  then params="${params} ipv6=\"${PT_ipv6}\""
fi

if [ ! -z "${PT_private_networking+x}" ];
  then params="${params} private_networking=\"${PT_private_networking}\""
fi

ansible localhost -m digital_ocean --args "${params}" --one-line | cut -f2- -d">"