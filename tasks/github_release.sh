#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_repo+x}" ];
  then params="${params} repo=\"${PT_repo}\""
fi

if [ ! -z "${PT_action+x}" ];
  then params="${params} action=\"${PT_action}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

ansible localhost -m github_release --args "${params}" --one-line | cut -f2- -d">"