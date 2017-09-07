#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_keyserver+x}" ];
  then params="${params} keyserver=\"${PT_keyserver}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_data+x}" ];
  then params="${params} data=\"${PT_data}\""
fi

if [ ! -z "${PT_keyring+x}" ];
  then params="${params} keyring=\"${PT_keyring}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_file+x}" ];
  then params="${params} file=\"${PT_file}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
fi

ansible localhost -m apt_key --args "${params}" --one-line | cut -f2- -d">"