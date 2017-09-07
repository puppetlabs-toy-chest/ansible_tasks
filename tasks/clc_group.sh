#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_parent+x}" ];
  then params="${params} parent=\"${PT_parent}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

ansible localhost -m clc_group --args "${params}" --one-line | cut -f2- -d">"