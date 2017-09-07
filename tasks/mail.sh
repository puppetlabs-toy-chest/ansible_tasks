#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_body+x}" ];
  then params="${params} body=\"${PT_body}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_secure+x}" ];
  then params="${params} secure=\"${PT_secure}\""
fi

if [ ! -z "${PT_cc+x}" ];
  then params="${params} cc=\"${PT_cc}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_to+x}" ];
  then params="${params} to=\"${PT_to}\""
fi

if [ ! -z "${PT_subject+x}" ];
  then params="${params} subject=\"${PT_subject}\""
fi

if [ ! -z "${PT_from+x}" ];
  then params="${params} from=\"${PT_from}\""
fi

if [ ! -z "${PT_headers+x}" ];
  then params="${params} headers=\"${PT_headers}\""
fi

if [ ! -z "${PT_charset+x}" ];
  then params="${params} charset=\"${PT_charset}\""
fi

if [ ! -z "${PT_bcc+x}" ];
  then params="${params} bcc=\"${PT_bcc}\""
fi

if [ ! -z "${PT_attach+x}" ];
  then params="${params} attach=\"${PT_attach}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_subtype+x}" ];
  then params="${params} subtype=\"${PT_subtype}\""
fi

ansible localhost -m mail --args "${params}" --one-line | cut -f2- -d">"