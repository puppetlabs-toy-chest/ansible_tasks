#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_max_concurrent_sessions+x}" ];
  then params="${params} max_concurrent_sessions=\"${PT_max_concurrent_sessions}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_account_lock_timeout+x}" ];
  then params="${params} account_lock_timeout=\"${PT_account_lock_timeout}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_max_login_failure_count+x}" ];
  then params="${params} max_login_failure_count=\"${PT_max_login_failure_count}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

if [ ! -z "${PT_max_password_history_count+x}" ];
  then params="${params} max_password_history_count=\"${PT_max_password_history_count}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_credentials_timeout_threshold+x}" ];
  then params="${params} credentials_timeout_threshold=\"${PT_credentials_timeout_threshold}\""
fi

ansible localhost -m avi_useraccountprofile --args "${params}" --one-line | cut -f2- -d">"