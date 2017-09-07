#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_td+x}" ];
  then params="${params} td=\"${PT_td}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_ipv6address+x}" ];
  then params="${params} ipv6address=\"${PT_ipv6address}\""
fi

if [ ! -z "${PT_ipaddress+x}" ];
  then params="${params} ipaddress=\"${PT_ipaddress}\""
fi

if [ ! -z "${PT_save_config+x}" ];
  then params="${params} save_config=\"${PT_save_config}\""
fi

if [ ! -z "${PT_domainresolveretry+x}" ];
  then params="${params} domainresolveretry=\"${PT_domainresolveretry}\""
fi

if [ ! -z "${PT_nsip+x}" ];
  then params="${params} nsip=\"${PT_nsip}\""
fi

if [ ! -z "${PT_disabled+x}" ];
  then params="${params} disabled=\"${PT_disabled}\""
fi

if [ ! -z "${PT_nitro_protocol+x}" ];
  then params="${params} nitro_protocol=\"${PT_nitro_protocol}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_translationip+x}" ];
  then params="${params} translationip=\"${PT_translationip}\""
fi

if [ ! -z "${PT_nitro_user+x}" ];
  then params="${params} nitro_user=\"${PT_nitro_user}\""
fi

if [ ! -z "${PT_nitro_pass+x}" ];
  then params="${params} nitro_pass=\"${PT_nitro_pass}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_nitro_timeout+x}" ];
  then params="${params} nitro_timeout=\"${PT_nitro_timeout}\""
fi

if [ ! -z "${PT_translationmask+x}" ];
  then params="${params} translationmask=\"${PT_translationmask}\""
fi

ansible localhost -m netscaler_server --args "${params}" --one-line | cut -f2- -d">"