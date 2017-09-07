#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_body+x}" ];
  then params="${params} body=\"${PT_body}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_follow_redirects+x}" ];
  then params="${params} follow_redirects=\"${PT_follow_redirects}\""
fi

if [ ! -z "${PT_force_basic_auth+x}" ];
  then params="${params} force_basic_auth=\"${PT_force_basic_auth}\""
fi

if [ ! -z "${PT_removes+x}" ];
  then params="${params} removes=\"${PT_removes}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_others+x}" ];
  then params="${params} others=\"${PT_others}\""
fi

if [ ! -z "${PT_body_format+x}" ];
  then params="${params} body_format=\"${PT_body_format}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_HEADER_+x}" ];
  then params="${params} HEADER_=\"${PT_HEADER_}\""
fi

if [ ! -z "${PT_client_key+x}" ];
  then params="${params} client_key=\"${PT_client_key}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_method+x}" ];
  then params="${params} method=\"${PT_method}\""
fi

if [ ! -z "${PT_creates+x}" ];
  then params="${params} creates=\"${PT_creates}\""
fi

if [ ! -z "${PT_headers+x}" ];
  then params="${params} headers=\"${PT_headers}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_status_code+x}" ];
  then params="${params} status_code=\"${PT_status_code}\""
fi

if [ ! -z "${PT_return_content+x}" ];
  then params="${params} return_content=\"${PT_return_content}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_client_cert+x}" ];
  then params="${params} client_cert=\"${PT_client_cert}\""
fi

ansible localhost -m uri --args "${params}" --one-line | cut -f2- -d">"