#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_component+x}" ];
  then params="${params} component=\"${PT_component}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_hosts+x}" ];
  then params="${params} hosts=\"${PT_hosts}\""
fi

if [ ! -z "${PT_env+x}" ];
  then params="${params} env=\"${PT_env}\""
fi

if [ ! -z "${PT_owner+x}" ];
  then params="${params} owner=\"${PT_owner}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m bigpanda --args "${params}" --one-line | cut -f2- -d">"