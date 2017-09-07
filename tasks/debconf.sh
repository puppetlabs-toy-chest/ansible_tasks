#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

if [ ! -z "${PT_vtype+x}" ];
  then params="${params} vtype=\"${PT_vtype}\""
fi

if [ ! -z "${PT_question+x}" ];
  then params="${params} question=\"${PT_question}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_unseen+x}" ];
  then params="${params} unseen=\"${PT_unseen}\""
fi

ansible localhost -m debconf --args "${params}" --one-line | cut -f2- -d">"