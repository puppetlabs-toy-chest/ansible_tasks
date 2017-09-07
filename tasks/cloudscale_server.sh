#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_volume_size_gb+x}" ];
  then params="${params} volume_size_gb=\"${PT_volume_size_gb}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_use_public_network+x}" ];
  then params="${params} use_public_network=\"${PT_use_public_network}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_use_ipv6+x}" ];
  then params="${params} use_ipv6=\"${PT_use_ipv6}\""
fi

if [ ! -z "${PT_user_data+x}" ];
  then params="${params} user_data=\"${PT_user_data}\""
fi

if [ ! -z "${PT_anti_affinity_with+x}" ];
  then params="${params} anti_affinity_with=\"${PT_anti_affinity_with}\""
fi

if [ ! -z "${PT_use_private_network+x}" ];
  then params="${params} use_private_network=\"${PT_use_private_network}\""
fi

if [ ! -z "${PT_bulk_volume_size_gb+x}" ];
  then params="${params} bulk_volume_size_gb=\"${PT_bulk_volume_size_gb}\""
fi

if [ ! -z "${PT_api_token+x}" ];
  then params="${params} api_token=\"${PT_api_token}\""
fi

if [ ! -z "${PT_flavor+x}" ];
  then params="${params} flavor=\"${PT_flavor}\""
fi

if [ ! -z "${PT_ssh_keys+x}" ];
  then params="${params} ssh_keys=\"${PT_ssh_keys}\""
fi

ansible localhost -m cloudscale_server --args "${params}" --one-line | cut -f2- -d">"