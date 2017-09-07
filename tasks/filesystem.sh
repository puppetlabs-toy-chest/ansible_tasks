#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_resizefs+x}" ];
  then params="${params} resizefs=\"${PT_resizefs}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_dev+x}" ];
  then params="${params} dev=\"${PT_dev}\""
fi

if [ ! -z "${PT_opts+x}" ];
  then params="${params} opts=\"${PT_opts}\""
fi

if [ ! -z "${PT_fstype+x}" ];
  then params="${params} fstype=\"${PT_fstype}\""
fi

ansible localhost -m filesystem --args "${params}" --one-line | cut -f2- -d">"