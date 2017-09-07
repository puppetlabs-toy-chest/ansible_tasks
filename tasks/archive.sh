#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_group+x}" ];
  then params="${params} group=\"${PT_group}\""
fi

if [ ! -z "${PT_format+x}" ];
  then params="${params} format=\"${PT_format}\""
fi

if [ ! -z "${PT_unsafe_writes+x}" ];
  then params="${params} unsafe_writes=\"${PT_unsafe_writes}\""
fi

if [ ! -z "${PT_selevel+x}" ];
  then params="${params} selevel=\"${PT_selevel}\""
fi

if [ ! -z "${PT_seuser+x}" ];
  then params="${params} seuser=\"${PT_seuser}\""
fi

if [ ! -z "${PT_serole+x}" ];
  then params="${params} serole=\"${PT_serole}\""
fi

if [ ! -z "${PT_remove+x}" ];
  then params="${params} remove=\"${PT_remove}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_setype+x}" ];
  then params="${params} setype=\"${PT_setype}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_owner+x}" ];
  then params="${params} owner=\"${PT_owner}\""
fi

if [ ! -z "${PT_attributes+x}" ];
  then params="${params} attributes=\"${PT_attributes}\""
fi

ansible localhost -m archive --args "${params}" --one-line | cut -f2- -d">"