#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_params+x}" ];
  then params="${params} params=\"${PT_params}\""
fi

if [ ! -z "${PT_server_url+x}" ];
  then params="${params} server_url=\"${PT_server_url}\""
fi

if [ ! -z "${PT_entity+x}" ];
  then params="${params} entity=\"${PT_entity}\""
fi

ansible localhost -m katello --args "${params}" --one-line | cut -f2- -d">"