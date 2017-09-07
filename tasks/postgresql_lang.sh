#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_lang+x}" ];
  then params="${params} lang=\"${PT_lang}\""
fi

if [ ! -z "${PT_force_trust+x}" ];
  then params="${params} force_trust=\"${PT_force_trust}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_login_host+x}" ];
  then params="${params} login_host=\"${PT_login_host}\""
fi

if [ ! -z "${PT_db+x}" ];
  then params="${params} db=\"${PT_db}\""
fi

if [ ! -z "${PT_cascade+x}" ];
  then params="${params} cascade=\"${PT_cascade}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_trust+x}" ];
  then params="${params} trust=\"${PT_trust}\""
fi

if [ ! -z "${PT_fail_on_drop+x}" ];
  then params="${params} fail_on_drop=\"${PT_fail_on_drop}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

ansible localhost -m postgresql_lang --args "${params}" --one-line | cut -f2- -d">"