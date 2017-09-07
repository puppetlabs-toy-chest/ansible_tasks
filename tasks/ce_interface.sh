#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_admin_state+x}" ];
  then params="${params} admin_state=\"${PT_admin_state}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_interface_type+x}" ];
  then params="${params} interface_type=\"${PT_interface_type}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_l2sub+x}" ];
  then params="${params} l2sub=\"${PT_l2sub}\""
fi

ansible localhost -m ce_interface --args "${params}" --one-line | cut -f2- -d">"