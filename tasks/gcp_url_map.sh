#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_default_service+x}" ];
  then params="${params} default_service=\"${PT_default_service}\""
fi

if [ ! -z "${PT_host_rules+x}" ];
  then params="${params} host_rules=\"${PT_host_rules}\""
fi

if [ ! -z "${PT_url_map_name+x}" ];
  then params="${params} url_map_name=\"${PT_url_map_name}\""
fi

if [ ! -z "${PT_path_matchers+x}" ];
  then params="${params} path_matchers=\"${PT_path_matchers}\""
fi

ansible localhost -m gcp_url_map --args "${params}" --one-line | cut -f2- -d">"