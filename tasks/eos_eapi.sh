#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_authorize+x}" ];
  then params="${params} authorize=\"${PT_authorize}\""
fi

if [ ! -z "${PT_local_http_port+x}" ];
  then params="${params} local_http_port=\"${PT_local_http_port}\""
fi

if [ ! -z "${PT_http_port+x}" ];
  then params="${params} http_port=\"${PT_http_port}\""
fi

if [ ! -z "${PT_http+x}" ];
  then params="${params} http=\"${PT_http}\""
fi

if [ ! -z "${PT_https_port+x}" ];
  then params="${params} https_port=\"${PT_https_port}\""
fi

if [ ! -z "${PT_auth_pass+x}" ];
  then params="${params} auth_pass=\"${PT_auth_pass}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_vrf+x}" ];
  then params="${params} vrf=\"${PT_vrf}\""
fi

if [ ! -z "${PT_https+x}" ];
  then params="${params} https=\"${PT_https}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_config+x}" ];
  then params="${params} config=\"${PT_config}\""
fi

if [ ! -z "${PT_local_http+x}" ];
  then params="${params} local_http=\"${PT_local_http}\""
fi

if [ ! -z "${PT_socket+x}" ];
  then params="${params} socket=\"${PT_socket}\""
fi

ansible localhost -m eos_eapi --args "${params}" --one-line | cut -f2- -d">"