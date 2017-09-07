#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_service_address+x}" ];
  then params="${params} service_address=\"${PT_service_address}\""
fi

if [ ! -z "${PT_http+x}" ];
  then params="${params} http=\"${PT_http}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_check_name+x}" ];
  then params="${params} check_name=\"${PT_check_name}\""
fi

if [ ! -z "${PT_service_name+x}" ];
  then params="${params} service_name=\"${PT_service_name}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_ttl+x}" ];
  then params="${params} ttl=\"${PT_ttl}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_script+x}" ];
  then params="${params} script=\"${PT_script}\""
fi

if [ ! -z "${PT_check_id+x}" ];
  then params="${params} check_id=\"${PT_check_id}\""
fi

if [ ! -z "${PT_service_port+x}" ];
  then params="${params} service_port=\"${PT_service_port}\""
fi

if [ ! -z "${PT_notes+x}" ];
  then params="${params} notes=\"${PT_notes}\""
fi

if [ ! -z "${PT_interval+x}" ];
  then params="${params} interval=\"${PT_interval}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_service_id+x}" ];
  then params="${params} service_id=\"${PT_service_id}\""
fi

if [ ! -z "${PT_scheme+x}" ];
  then params="${params} scheme=\"${PT_scheme}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m consul --args "${params}" --one-line | cut -f2- -d">"