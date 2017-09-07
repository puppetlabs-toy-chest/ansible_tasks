#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_links+x}" ];
  then params="${params} links=\"${PT_links}\""
fi

if [ ! -z "${PT_title+x}" ];
  then params="${params} title=\"${PT_title}\""
fi

if [ ! -z "${PT_start_time+x}" ];
  then params="${params} start_time=\"${PT_start_time}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_end_time+x}" ];
  then params="${params} end_time=\"${PT_end_time}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

ansible localhost -m librato_annotation --args "${params}" --one-line | cut -f2- -d">"