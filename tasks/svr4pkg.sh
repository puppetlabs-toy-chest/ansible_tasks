#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_category+x}" ];
  then params="${params} category=\"${PT_category}\""
fi

if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_response_file+x}" ];
  then params="${params} response_file=\"${PT_response_file}\""
fi

if [ ! -z "${PT_proxy+x}" ];
  then params="${params} proxy=\"${PT_proxy}\""
fi

ansible localhost -m svr4pkg --args "${params}" --one-line | cut -f2- -d">"