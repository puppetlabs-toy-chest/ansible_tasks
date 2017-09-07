#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_user_password+x}" ];
  then params="${params} user_password=\"${PT_user_password}\""
fi

if [ ! -z "${PT_expected_return_code+x}" ];
  then params="${params} expected_return_code=\"${PT_expected_return_code}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_arguments+x}" ];
  then params="${params} arguments=\"${PT_arguments}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_user_name+x}" ];
  then params="${params} user_name=\"${PT_user_name}\""
fi

if [ ! -z "${PT_product_id+x}" ];
  then params="${params} product_id=\"${PT_product_id}\""
fi

ansible localhost -m win_package --args "${params}" --one-line | cut -f2- -d">"