#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_selevel+x}" ];
  then params="${params} selevel=\"${PT_selevel}\""
fi

if [ ! -z "${PT_insertafter+x}" ];
  then params="${params} insertafter=\"${PT_insertafter}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_marker+x}" ];
  then params="${params} marker=\"${PT_marker}\""
fi

if [ ! -z "${PT_follow+x}" ];
  then params="${params} follow=\"${PT_follow}\""
fi

if [ ! -z "${PT_validate+x}" ];
  then params="${params} validate=\"${PT_validate}\""
fi

if [ ! -z "${PT_group+x}" ];
  then params="${params} group=\"${PT_group}\""
fi

if [ ! -z "${PT_insertbefore+x}" ];
  then params="${params} insertbefore=\"${PT_insertbefore}\""
fi

if [ ! -z "${PT_unsafe_writes+x}" ];
  then params="${params} unsafe_writes=\"${PT_unsafe_writes}\""
fi

if [ ! -z "${PT_create+x}" ];
  then params="${params} create=\"${PT_create}\""
fi

if [ ! -z "${PT_seuser+x}" ];
  then params="${params} seuser=\"${PT_seuser}\""
fi

if [ ! -z "${PT_serole+x}" ];
  then params="${params} serole=\"${PT_serole}\""
fi

if [ ! -z "${PT_owner+x}" ];
  then params="${params} owner=\"${PT_owner}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_attributes+x}" ];
  then params="${params} attributes=\"${PT_attributes}\""
fi

if [ ! -z "${PT_backup+x}" ];
  then params="${params} backup=\"${PT_backup}\""
fi

if [ ! -z "${PT_block+x}" ];
  then params="${params} block=\"${PT_block}\""
fi

if [ ! -z "${PT_setype+x}" ];
  then params="${params} setype=\"${PT_setype}\""
fi

ansible localhost -m blockinfile --args "${params}" --one-line | cut -f2- -d">"