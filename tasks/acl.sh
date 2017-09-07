#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_recursive+x}" ];
  then params="${params} recursive=\"${PT_recursive}\""
fi

if [ ! -z "${PT_default+x}" ];
  then params="${params} default=\"${PT_default}\""
fi

if [ ! -z "${PT_entity+x}" ];
  then params="${params} entity=\"${PT_entity}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_follow+x}" ];
  then params="${params} follow=\"${PT_follow}\""
fi

if [ ! -z "${PT_etype+x}" ];
  then params="${params} etype=\"${PT_etype}\""
fi

if [ ! -z "${PT_entry+x}" ];
  then params="${params} entry=\"${PT_entry}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_permissions+x}" ];
  then params="${params} permissions=\"${PT_permissions}\""
fi

ansible localhost -m acl --args "${params}" --one-line | cut -f2- -d">"