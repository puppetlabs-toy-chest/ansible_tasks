#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_dn+x}" ];
  then params="${params} dn=\"${PT_dn}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_server_uri+x}" ];
  then params="${params} server_uri=\"${PT_server_uri}\""
fi

if [ ! -z "${PT_start_tls+x}" ];
  then params="${params} start_tls=\"${PT_start_tls}\""
fi

if [ ! -z "${PT_bind_dn+x}" ];
  then params="${params} bind_dn=\"${PT_bind_dn}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_values+x}" ];
  then params="${params} values=\"${PT_values}\""
fi

if [ ! -z "${PT_bind_pw+x}" ];
  then params="${params} bind_pw=\"${PT_bind_pw}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m ldap_attr --args "${params}" --one-line | cut -f2- -d">"