#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_status+x}" ];
  then params="${params} status=\"${PT_status}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_method+x}" ];
  then params="${params} method=\"${PT_method}\""
fi

if [ ! -z "${PT_alias+x}" ];
  then params="${params} alias=\"${PT_alias}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_nodes+x}" ];
  then params="${params} nodes=\"${PT_nodes}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_persistence+x}" ];
  then params="${params} persistence=\"${PT_persistence}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

ansible localhost -m clc_loadbalancer --args "${params}" --one-line | cut -f2- -d">"