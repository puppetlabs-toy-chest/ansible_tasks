#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_depends+x}" ];
  then params="${params} depends=\"${PT_depends}\""
fi

if [ ! -z "${PT_update_cache+x}" ];
  then params="${params} update_cache=\"${PT_update_cache}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_update+x}" ];
  then params="${params} update=\"${PT_update}\""
fi

if [ ! -z "${PT_cache_valid_time+x}" ];
  then params="${params} cache_valid_time=\"${PT_cache_valid_time}\""
fi

ansible localhost -m sorcery --args "${params}" --one-line | cut -f2- -d">"