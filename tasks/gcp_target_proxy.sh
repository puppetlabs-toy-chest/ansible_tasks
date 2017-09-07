#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_target_proxy_type+x}" ];
  then params="${params} target_proxy_type=\"${PT_target_proxy_type}\""
fi

if [ ! -z "${PT_target_proxy_name+x}" ];
  then params="${params} target_proxy_name=\"${PT_target_proxy_name}\""
fi

if [ ! -z "${PT_url_map_name+x}" ];
  then params="${params} url_map_name=\"${PT_url_map_name}\""
fi

ansible localhost -m gcp_target_proxy --args "${params}" --one-line | cut -f2- -d">"