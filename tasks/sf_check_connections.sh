#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_svip+x}" ];
  then params="${params} svip=\"${PT_svip}\""
fi

if [ ! -z "${PT_skip+x}" ];
  then params="${params} skip=\"${PT_skip}\""
fi

if [ ! -z "${PT_mvip+x}" ];
  then params="${params} mvip=\"${PT_mvip}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

ansible localhost -m sf_check_connections --args "${params}" --one-line | cut -f2- -d">"