#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_repo+x}" ];
  then params="${params} repo=\"${PT_repo}\""
fi

if [ ! -z "${PT_environment+x}" ];
  then params="${params} environment=\"${PT_environment}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_revision+x}" ];
  then params="${params} revision=\"${PT_revision}\""
fi

ansible localhost -m honeybadger_deployment --args "${params}" --one-line | cut -f2- -d">"