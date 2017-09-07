#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_cas+x}" ];
  then params="${params} cas=\"${PT_cas}\""
fi

if [ ! -z "${PT_recurse+x}" ];
  then params="${params} recurse=\"${PT_recurse}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_session+x}" ];
  then params="${params} session=\"${PT_session}\""
fi

if [ ! -z "${PT_flags+x}" ];
  then params="${params} flags=\"${PT_flags}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_scheme+x}" ];
  then params="${params} scheme=\"${PT_scheme}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

ansible localhost -m consul_kv --args "${params}" --one-line | cut -f2- -d">"