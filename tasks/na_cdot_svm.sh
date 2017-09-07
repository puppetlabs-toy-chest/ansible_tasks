#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_root_volume_aggregate+x}" ];
  then params="${params} root_volume_aggregate=\"${PT_root_volume_aggregate}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_root_volume_security_style+x}" ];
  then params="${params} root_volume_security_style=\"${PT_root_volume_security_style}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_root_volume+x}" ];
  then params="${params} root_volume=\"${PT_root_volume}\""
fi

ansible localhost -m na_cdot_svm --args "${params}" --one-line | cut -f2- -d">"