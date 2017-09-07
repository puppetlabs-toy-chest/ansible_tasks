#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_purge_rules+x}" ];
  then params="${params} purge_rules=\"${PT_purge_rules}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_rules+x}" ];
  then params="${params} rules=\"${PT_rules}\""
fi

if [ ! -z "${PT_client_id+x}" ];
  then params="${params} client_id=\"${PT_client_id}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_resource_group+x}" ];
  then params="${params} resource_group=\"${PT_resource_group}\""
fi

if [ ! -z "${PT_append_tags+x}" ];
  then params="${params} append_tags=\"${PT_append_tags}\""
fi

if [ ! -z "${PT_ad_user+x}" ];
  then params="${params} ad_user=\"${PT_ad_user}\""
fi

if [ ! -z "${PT_secret+x}" ];
  then params="${params} secret=\"${PT_secret}\""
fi

if [ ! -z "${PT_default_rules+x}" ];
  then params="${params} default_rules=\"${PT_default_rules}\""
fi

if [ ! -z "${PT_purge_default_rules+x}" ];
  then params="${params} purge_default_rules=\"${PT_purge_default_rules}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_subscription_id+x}" ];
  then params="${params} subscription_id=\"${PT_subscription_id}\""
fi

ansible localhost -m azure_rm_securitygroup --args "${params}" --one-line | cut -f2- -d">"