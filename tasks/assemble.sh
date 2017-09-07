#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_remote_src+x}" ];
  then params="${params} remote_src=\"${PT_remote_src}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_selevel+x}" ];
  then params="${params} selevel=\"${PT_selevel}\""
fi

if [ ! -z "${PT_decrypt+x}" ];
  then params="${params} decrypt=\"${PT_decrypt}\""
fi

if [ ! -z "${PT_owner+x}" ];
  then params="${params} owner=\"${PT_owner}\""
fi

if [ ! -z "${PT_regexp+x}" ];
  then params="${params} regexp=\"${PT_regexp}\""
fi

if [ ! -z "${PT_validate+x}" ];
  then params="${params} validate=\"${PT_validate}\""
fi

if [ ! -z "${PT_ignore_hidden+x}" ];
  then params="${params} ignore_hidden=\"${PT_ignore_hidden}\""
fi

if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_group+x}" ];
  then params="${params} group=\"${PT_group}\""
fi

if [ ! -z "${PT_unsafe_writes+x}" ];
  then params="${params} unsafe_writes=\"${PT_unsafe_writes}\""
fi

if [ ! -z "${PT_delimiter+x}" ];
  then params="${params} delimiter=\"${PT_delimiter}\""
fi

if [ ! -z "${PT_seuser+x}" ];
  then params="${params} seuser=\"${PT_seuser}\""
fi

if [ ! -z "${PT_setype+x}" ];
  then params="${params} setype=\"${PT_setype}\""
fi

if [ ! -z "${PT_serole+x}" ];
  then params="${params} serole=\"${PT_serole}\""
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

ansible localhost -m assemble --args "${params}" --one-line | cut -f2- -d">"