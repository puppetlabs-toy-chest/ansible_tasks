#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
fi

if [ ! -z "${PT_enable_cdn+x}" ];
  then params="${params} enable_cdn=\"${PT_enable_cdn}\""
fi

if [ ! -z "${PT_service_account_email+x}" ];
  then params="${params} service_account_email=\"${PT_service_account_email}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_backends+x}" ];
  then params="${params} backends=\"${PT_backends}\""
fi

if [ ! -z "${PT_port_name+x}" ];
  then params="${params} port_name=\"${PT_port_name}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_credentials_file+x}" ];
  then params="${params} credentials_file=\"${PT_credentials_file}\""
fi

if [ ! -z "${PT_healthchecks+x}" ];
  then params="${params} healthchecks=\"${PT_healthchecks}\""
fi

if [ ! -z "${PT_backend_service_name+x}" ];
  then params="${params} backend_service_name=\"${PT_backend_service_name}\""
fi

if [ ! -z "${PT_project_id+x}" ];
  then params="${params} project_id=\"${PT_project_id}\""
fi

ansible localhost -m gcp_backend_service --args "${params}" --one-line | cut -f2- -d">"