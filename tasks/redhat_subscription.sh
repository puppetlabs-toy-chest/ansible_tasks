#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_server_hostname+x}" ];
  then params="${params} server_hostname=\"${PT_server_hostname}\""
fi

if [ ! -z "${PT_pool_ids+x}" ];
  then params="${params} pool_ids=\"${PT_pool_ids}\""
fi

if [ ! -z "${PT_consumer_id+x}" ];
  then params="${params} consumer_id=\"${PT_consumer_id}\""
fi

if [ ! -z "${PT_activationkey+x}" ];
  then params="${params} activationkey=\"${PT_activationkey}\""
fi

if [ ! -z "${PT_server_insecure+x}" ];
  then params="${params} server_insecure=\"${PT_server_insecure}\""
fi

if [ ! -z "${PT_consumer_name+x}" ];
  then params="${params} consumer_name=\"${PT_consumer_name}\""
fi

if [ ! -z "${PT_rhsm_baseurl+x}" ];
  then params="${params} rhsm_baseurl=\"${PT_rhsm_baseurl}\""
fi

if [ ! -z "${PT_pool+x}" ];
  then params="${params} pool=\"${PT_pool}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_consumer_type+x}" ];
  then params="${params} consumer_type=\"${PT_consumer_type}\""
fi

if [ ! -z "${PT_org_id+x}" ];
  then params="${params} org_id=\"${PT_org_id}\""
fi

if [ ! -z "${PT_environment+x}" ];
  then params="${params} environment=\"${PT_environment}\""
fi

if [ ! -z "${PT_force_register+x}" ];
  then params="${params} force_register=\"${PT_force_register}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_autosubscribe+x}" ];
  then params="${params} autosubscribe=\"${PT_autosubscribe}\""
fi

ansible localhost -m redhat_subscription --args "${params}" --one-line | cut -f2- -d">"