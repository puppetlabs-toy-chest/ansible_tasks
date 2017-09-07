#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
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

if [ ! -z "${PT_storage+x}" ];
  then params="${params} storage=\"${PT_storage}\""
fi

if [ ! -z "${PT_api_region+x}" ];
  then params="${params} api_region=\"${PT_api_region}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

if [ ! -z "${PT_cluster+x}" ];
  then params="${params} cluster=\"${PT_cluster}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_account+x}" ];
  then params="${params} account=\"${PT_account}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

ansible localhost -m cs_configuration --args "${params}" --one-line | cut -f2- -d">"