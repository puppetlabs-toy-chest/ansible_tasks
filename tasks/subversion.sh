#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_executable+x}" ];
  then params="${params} executable=\"${PT_executable}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_update+x}" ];
  then params="${params} update=\"${PT_update}\""
fi

if [ ! -z "${PT_repo+x}" ];
  then params="${params} repo=\"${PT_repo}\""
fi

if [ ! -z "${PT_switch+x}" ];
  then params="${params} switch=\"${PT_switch}\""
fi

if [ ! -z "${PT_export+x}" ];
  then params="${params} export=\"${PT_export}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_checkout+x}" ];
  then params="${params} checkout=\"${PT_checkout}\""
fi

if [ ! -z "${PT_revision+x}" ];
  then params="${params} revision=\"${PT_revision}\""
fi

ansible localhost -m subversion --args "${params}" --one-line | cut -f2- -d">"