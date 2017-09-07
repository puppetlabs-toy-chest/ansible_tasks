#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_authorize+x}" ];
  then params="${params} authorize=\"${PT_authorize}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_after+x}" ];
  then params="${params} after=\"${PT_after}\""
fi

if [ ! -z "${PT_lines+x}" ];
  then params="${params} lines=\"${PT_lines}\""
fi

if [ ! -z "${PT_replace+x}" ];
  then params="${params} replace=\"${PT_replace}\""
fi

if [ ! -z "${PT_context+x}" ];
  then params="${params} context=\"${PT_context}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_config+x}" ];
  then params="${params} config=\"${PT_config}\""
fi

if [ ! -z "${PT_match+x}" ];
  then params="${params} match=\"${PT_match}\""
fi

if [ ! -z "${PT_before+x}" ];
  then params="${params} before=\"${PT_before}\""
fi

ansible localhost -m asa_acl --args "${params}" --one-line | cut -f2- -d">"