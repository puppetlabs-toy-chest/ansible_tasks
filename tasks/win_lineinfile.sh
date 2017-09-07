#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_insertbefore+x}" ];
  then params="${params} insertbefore=\"${PT_insertbefore}\""
fi

if [ ! -z "${PT_encoding+x}" ];
  then params="${params} encoding=\"${PT_encoding}\""
fi

if [ ! -z "${PT_create+x}" ];
  then params="${params} create=\"${PT_create}\""
fi

if [ ! -z "${PT_newline+x}" ];
  then params="${params} newline=\"${PT_newline}\""
fi

if [ ! -z "${PT_backrefs+x}" ];
  then params="${params} backrefs=\"${PT_backrefs}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_insertafter+x}" ];
  then params="${params} insertafter=\"${PT_insertafter}\""
fi

if [ ! -z "${PT_regexp+x}" ];
  then params="${params} regexp=\"${PT_regexp}\""
fi

if [ ! -z "${PT_line+x}" ];
  then params="${params} line=\"${PT_line}\""
fi

if [ ! -z "${PT_backup+x}" ];
  then params="${params} backup=\"${PT_backup}\""
fi

if [ ! -z "${PT_validate+x}" ];
  then params="${params} validate=\"${PT_validate}\""
fi

ansible localhost -m win_lineinfile --args "${params}" --one-line | cut -f2- -d">"