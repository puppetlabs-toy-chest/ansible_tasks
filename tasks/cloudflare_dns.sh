#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_solo+x}" ];
  then params="${params} solo=\"${PT_solo}\""
fi

if [ ! -z "${PT_account_email+x}" ];
  then params="${params} account_email=\"${PT_account_email}\""
fi

if [ ! -z "${PT_weight+x}" ];
  then params="${params} weight=\"${PT_weight}\""
fi

if [ ! -z "${PT_proxied+x}" ];
  then params="${params} proxied=\"${PT_proxied}\""
fi

if [ ! -z "${PT_ttl+x}" ];
  then params="${params} ttl=\"${PT_ttl}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_account_api_token+x}" ];
  then params="${params} account_api_token=\"${PT_account_api_token}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_service+x}" ];
  then params="${params} service=\"${PT_service}\""
fi

if [ ! -z "${PT_proto+x}" ];
  then params="${params} proto=\"${PT_proto}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

if [ ! -z "${PT_priority+x}" ];
  then params="${params} priority=\"${PT_priority}\""
fi

if [ ! -z "${PT_record+x}" ];
  then params="${params} record=\"${PT_record}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

ansible localhost -m cloudflare_dns --args "${params}" --one-line | cut -f2- -d">"