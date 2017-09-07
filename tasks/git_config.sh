#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_repo+x}" ];
  then params="${params} repo=\"${PT_repo}\""
fi

if [ ! -z "${PT_scope+x}" ];
  then params="${params} scope=\"${PT_scope}\""
fi

if [ ! -z "${PT_list_all+x}" ];
  then params="${params} list_all=\"${PT_list_all}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

ansible localhost -m git_config --args "${params}" --one-line | cut -f2- -d">"