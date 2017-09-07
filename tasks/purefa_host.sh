#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_volume+x}" ];
  then params="${params} volume=\"${PT_volume}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_iqn+x}" ];
  then params="${params} iqn=\"${PT_iqn}\""
fi

if [ ! -z "${PT_api_token+x}" ];
  then params="${params} api_token=\"${PT_api_token}\""
fi

if [ ! -z "${PT_wwns+x}" ];
  then params="${params} wwns=\"${PT_wwns}\""
fi

if [ ! -z "${PT_fa_url+x}" ];
  then params="${params} fa_url=\"${PT_fa_url}\""
fi

ansible localhost -m purefa_host --args "${params}" --one-line | cut -f2- -d">"