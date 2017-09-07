#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_priority+x}" ];
  then params="${params} priority=\"${PT_priority}\""
fi

if [ ! -z "${PT_excluded_volumes+x}" ];
  then params="${params} excluded_volumes=\"${PT_excluded_volumes}\""
fi

if [ ! -z "${PT_included_volumes+x}" ];
  then params="${params} included_volumes=\"${PT_included_volumes}\""
fi

if [ ! -z "${PT_freespace_consolidation+x}" ];
  then params="${params} freespace_consolidation=\"${PT_freespace_consolidation}\""
fi

if [ ! -z "${PT_parallel+x}" ];
  then params="${params} parallel=\"${PT_parallel}\""
fi

ansible localhost -m win_defrag --args "${params}" --one-line | cut -f2- -d">"