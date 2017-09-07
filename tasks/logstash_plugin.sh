#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_proxy_port+x}" ];
  then params="${params} proxy_port=\"${PT_proxy_port}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_proxy_host+x}" ];
  then params="${params} proxy_host=\"${PT_proxy_host}\""
fi

if [ ! -z "${PT_plugin_bin+x}" ];
  then params="${params} plugin_bin=\"${PT_plugin_bin}\""
fi

ansible localhost -m logstash_plugin --args "${params}" --one-line | cut -f2- -d">"