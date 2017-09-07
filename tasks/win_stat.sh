#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_get_md5+x}" ];
  then params="${params} get_md5=\"${PT_get_md5}\""
fi

if [ ! -z "${PT_get_checksum+x}" ];
  then params="${params} get_checksum=\"${PT_get_checksum}\""
fi

if [ ! -z "${PT_checksum_algorithm+x}" ];
  then params="${params} checksum_algorithm=\"${PT_checksum_algorithm}\""
fi

ansible localhost -m win_stat --args "${params}" --one-line | cut -f2- -d">"