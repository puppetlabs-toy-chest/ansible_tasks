#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_volume_access_group_id+x}" ];
  then params="${params} volume_access_group_id=\"${PT_volume_access_group_id}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_virtual_network_id+x}" ];
  then params="${params} virtual_network_id=\"${PT_virtual_network_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_volumes+x}" ];
  then params="${params} volumes=\"${PT_volumes}\""
fi

if [ ! -z "${PT_initiators+x}" ];
  then params="${params} initiators=\"${PT_initiators}\""
fi

if [ ! -z "${PT_attributes+x}" ];
  then params="${params} attributes=\"${PT_attributes}\""
fi

if [ ! -z "${PT_virtual_network_tags+x}" ];
  then params="${params} virtual_network_tags=\"${PT_virtual_network_tags}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

ansible localhost -m sf_volume_access_group_manager --args "${params}" --one-line | cut -f2- -d">"