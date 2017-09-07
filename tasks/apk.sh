#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_available+x}" ];
  then params="${params} available=\"${PT_available}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_upgrade+x}" ];
  then params="${params} upgrade=\"${PT_upgrade}\""
fi

if [ ! -z "${PT_update_cache+x}" ];
  then params="${params} update_cache=\"${PT_update_cache}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_repository+x}" ];
  then params="${params} repository=\"${PT_repository}\""
fi

ansible localhost -m apk --args "${params}" --one-line | cut -f2- -d">"