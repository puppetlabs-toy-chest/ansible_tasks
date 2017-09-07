#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_licenses+x}" ];
  then params="${params} licenses=\"${PT_licenses}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_remove_unused+x}" ];
  then params="${params} remove_unused=\"${PT_remove_unused}\""
fi

if [ ! -z "${PT_remove_expired+x}" ];
  then params="${params} remove_expired=\"${PT_remove_expired}\""
fi

if [ ! -z "${PT_serial_number+x}" ];
  then params="${params} serial_number=\"${PT_serial_number}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

ansible localhost -m na_cdot_license --args "${params}" --one-line | cut -f2- -d">"