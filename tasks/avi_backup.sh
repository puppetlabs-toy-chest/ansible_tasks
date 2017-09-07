#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_scheduler_ref+x}" ];
  then params="${params} scheduler_ref=\"${PT_scheduler_ref}\""
fi

if [ ! -z "${PT_local_file_url+x}" ];
  then params="${params} local_file_url=\"${PT_local_file_url}\""
fi

if [ ! -z "${PT_file_name+x}" ];
  then params="${params} file_name=\"${PT_file_name}\""
fi

if [ ! -z "${PT_remote_file_url+x}" ];
  then params="${params} remote_file_url=\"${PT_remote_file_url}\""
fi

if [ ! -z "${PT_backup_config_ref+x}" ];
  then params="${params} backup_config_ref=\"${PT_backup_config_ref}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_tenant_ref+x}" ];
  then params="${params} tenant_ref=\"${PT_tenant_ref}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_timestamp+x}" ];
  then params="${params} timestamp=\"${PT_timestamp}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

ansible localhost -m avi_backup --args "${params}" --one-line | cut -f2- -d">"