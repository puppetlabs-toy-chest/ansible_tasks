#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_qos+x}" ];
  then params="${params} qos=\"${PT_qos}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_size_unit+x}" ];
  then params="${params} size_unit=\"${PT_size_unit}\""
fi

if [ ! -z "${PT_access+x}" ];
  then params="${params} access=\"${PT_access}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_size+x}" ];
  then params="${params} size=\"${PT_size}\""
fi

if [ ! -z "${PT_volume_id+x}" ];
  then params="${params} volume_id=\"${PT_volume_id}\""
fi

if [ ! -z "${PT_512emulation+x}" ];
  then params="${params} 512emulation=\"${PT_512emulation}\""
fi

if [ ! -z "${PT_attributes+x}" ];
  then params="${params} attributes=\"${PT_attributes}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_account_id+x}" ];
  then params="${params} account_id=\"${PT_account_id}\""
fi

ansible localhost -m sf_volume_manager --args "${params}" --one-line | cut -f2- -d">"