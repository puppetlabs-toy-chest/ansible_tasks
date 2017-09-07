#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name_servers+x}" ];
  then params="${params} name_servers=\"${PT_name_servers}\""
fi

if [ ! -z "${PT_domain_search+x}" ];
  then params="${params} domain_search=\"${PT_domain_search}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_domain_name+x}" ];
  then params="${params} domain_name=\"${PT_domain_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

ansible localhost -m junos_system --args "${params}" --one-line | cut -f2- -d">"