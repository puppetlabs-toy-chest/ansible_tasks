#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_tls+x}" ];
  then params="${params} tls=\"${PT_tls}\""
fi

if [ ! -z "${PT_balancer_vhost+x}" ];
  then params="${params} balancer_vhost=\"${PT_balancer_vhost}\""
fi

if [ ! -z "${PT_member_host+x}" ];
  then params="${params} member_host=\"${PT_member_host}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_balancer_url_suffix+x}" ];
  then params="${params} balancer_url_suffix=\"${PT_balancer_url_suffix}\""
fi

ansible localhost -m apache2_mod_proxy --args "${params}" --one-line | cut -f2- -d">"