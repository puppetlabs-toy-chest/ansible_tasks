#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_fail_key+x}" ];
  then params="${params} fail_key=\"${PT_fail_key}\""
fi

if [ ! -z "${PT_split+x}" ];
  then params="${params} split=\"${PT_split}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_database+x}" ];
  then params="${params} database=\"${PT_database}\""
fi

ansible localhost -m getent --args "${params}" --one-line | cut -f2- -d">"