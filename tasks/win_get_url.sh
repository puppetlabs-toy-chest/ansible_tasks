#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_skip_certificate_validation+x}" ];
  then params="${params} skip_certificate_validation=\"${PT_skip_certificate_validation}\""
fi

if [ ! -z "${PT_proxy_url+x}" ];
  then params="${params} proxy_url=\"${PT_proxy_url}\""
fi

if [ ! -z "${PT_proxy_password+x}" ];
  then params="${params} proxy_password=\"${PT_proxy_password}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_proxy_username+x}" ];
  then params="${params} proxy_username=\"${PT_proxy_username}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

ansible localhost -m win_get_url --args "${params}" --one-line | cut -f2- -d">"