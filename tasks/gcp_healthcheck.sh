#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_healthcheck_name+x}" ];
  then params="${params} healthcheck_name=\"${PT_healthcheck_name}\""
fi

if [ ! -z "${PT_healthcheck_type+x}" ];
  then params="${params} healthcheck_type=\"${PT_healthcheck_type}\""
fi

if [ ! -z "${PT_check_interval+x}" ];
  then params="${params} check_interval=\"${PT_check_interval}\""
fi

if [ ! -z "${PT_service_account_email+x}" ];
  then params="${params} service_account_email=\"${PT_service_account_email}\""
fi

if [ ! -z "${PT_healthy_threshold+x}" ];
  then params="${params} healthy_threshold=\"${PT_healthy_threshold}\""
fi

if [ ! -z "${PT_service_account_permissions+x}" ];
  then params="${params} service_account_permissions=\"${PT_service_account_permissions}\""
fi

if [ ! -z "${PT_unhealthy_threshold+x}" ];
  then params="${params} unhealthy_threshold=\"${PT_unhealthy_threshold}\""
fi

if [ ! -z "${PT_host_header+x}" ];
  then params="${params} host_header=\"${PT_host_header}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_credentials_file+x}" ];
  then params="${params} credentials_file=\"${PT_credentials_file}\""
fi

if [ ! -z "${PT_project_id+x}" ];
  then params="${params} project_id=\"${PT_project_id}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_request_path+x}" ];
  then params="${params} request_path=\"${PT_request_path}\""
fi

ansible localhost -m gcp_healthcheck --args "${params}" --one-line | cut -f2- -d">"