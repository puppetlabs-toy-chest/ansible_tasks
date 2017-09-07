#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_aggregate_name+x}" ];
  then params="${params} aggregate_name=\"${PT_aggregate_name}\""
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

if [ ! -z "${PT_vserver+x}" ];
  then params="${params} vserver=\"${PT_vserver}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_online+x}" ];
  then params="${params} online=\"${PT_online}\""
fi

if [ ! -z "${PT_infinite+x}" ];
  then params="${params} infinite=\"${PT_infinite}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_size+x}" ];
  then params="${params} size=\"${PT_size}\""
fi

ansible localhost -m na_cdot_volume --args "${params}" --one-line | cut -f2- -d">"