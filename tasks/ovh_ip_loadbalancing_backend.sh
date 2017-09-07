#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_endpoint+x}" ];
  then params="${params} endpoint=\"${PT_endpoint}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_weight+x}" ];
  then params="${params} weight=\"${PT_weight}\""
fi

if [ ! -z "${PT_probe+x}" ];
  then params="${params} probe=\"${PT_probe}\""
fi

if [ ! -z "${PT_application_key+x}" ];
  then params="${params} application_key=\"${PT_application_key}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_application_secret+x}" ];
  then params="${params} application_secret=\"${PT_application_secret}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_consumer_key+x}" ];
  then params="${params} consumer_key=\"${PT_consumer_key}\""
fi

if [ ! -z "${PT_backend+x}" ];
  then params="${params} backend=\"${PT_backend}\""
fi

ansible localhost -m ovh_ip_loadbalancing_backend --args "${params}" --one-line | cut -f2- -d">"