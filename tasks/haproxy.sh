#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_socket+x}" ];
  then params="${params} socket=\"${PT_socket}\""
fi

if [ ! -z "${PT_weight+x}" ];
  then params="${params} weight=\"${PT_weight}\""
fi

if [ ! -z "${PT_wait_interval+x}" ];
  then params="${params} wait_interval=\"${PT_wait_interval}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_backend+x}" ];
  then params="${params} backend=\"${PT_backend}\""
fi

if [ ! -z "${PT_wait_retries+x}" ];
  then params="${params} wait_retries=\"${PT_wait_retries}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_fail_on_not_found+x}" ];
  then params="${params} fail_on_not_found=\"${PT_fail_on_not_found}\""
fi

if [ ! -z "${PT_shutdown_sessions+x}" ];
  then params="${params} shutdown_sessions=\"${PT_shutdown_sessions}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

ansible localhost -m haproxy --args "${params}" --one-line | cut -f2- -d">"