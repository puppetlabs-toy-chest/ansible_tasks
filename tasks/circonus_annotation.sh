#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_category+x}" ];
  then params="${params} category=\"${PT_category}\""
fi

if [ ! -z "${PT_start+x}" ];
  then params="${params} start=\"${PT_start}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_title+x}" ];
  then params="${params} title=\"${PT_title}\""
fi

if [ ! -z "${PT_duration+x}" ];
  then params="${params} duration=\"${PT_duration}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_stop+x}" ];
  then params="${params} stop=\"${PT_stop}\""
fi

ansible localhost -m circonus_annotation --args "${params}" --one-line | cut -f2- -d">"