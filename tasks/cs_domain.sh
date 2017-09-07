#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_network_domain+x}" ];
  then params="${params} network_domain=\"${PT_network_domain}\""
fi

if [ ! -z "${PT_poll_async+x}" ];
  then params="${params} poll_async=\"${PT_poll_async}\""
fi

if [ ! -z "${PT_api_url+x}" ];
  then params="${params} api_url=\"${PT_api_url}\""
fi

if [ ! -z "${PT_api_http_method+x}" ];
  then params="${params} api_http_method=\"${PT_api_http_method}\""
fi

if [ ! -z "${PT_api_secret+x}" ];
  then params="${params} api_secret=\"${PT_api_secret}\""
fi

if [ ! -z "${PT_api_timeout+x}" ];
  then params="${params} api_timeout=\"${PT_api_timeout}\""
fi

if [ ! -z "${PT_api_region+x}" ];
  then params="${params} api_region=\"${PT_api_region}\""
fi

if [ ! -z "${PT_clean_up+x}" ];
  then params="${params} clean_up=\"${PT_clean_up}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

ansible localhost -m cs_domain --args "${params}" --one-line | cut -f2- -d">"