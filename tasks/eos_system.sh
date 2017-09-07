#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_authorize+x}" ];
  then params="${params} authorize=\"${PT_authorize}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_lookup_source+x}" ];
  then params="${params} lookup_source=\"${PT_lookup_source}\""
fi

if [ ! -z "${PT_domain_search+x}" ];
  then params="${params} domain_search=\"${PT_domain_search}\""
fi

if [ ! -z "${PT_auth_pass+x}" ];
  then params="${params} auth_pass=\"${PT_auth_pass}\""
fi

if [ ! -z "${PT_domain_name+x}" ];
  then params="${params} domain_name=\"${PT_domain_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_name_servers+x}" ];
  then params="${params} name_servers=\"${PT_name_servers}\""
fi

ansible localhost -m eos_system --args "${params}" --one-line | cut -f2- -d">"