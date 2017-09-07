#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_project_id+x}" ];
  then params="${params} project_id=\"${PT_project_id}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_family+x}" ];
  then params="${params} family=\"${PT_family}\""
fi

if [ ! -z "${PT_service_account_email+x}" ];
  then params="${params} service_account_email=\"${PT_service_account_email}\""
fi

if [ ! -z "${PT_pem_file+x}" ];
  then params="${params} pem_file=\"${PT_pem_file}\""
fi

if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

ansible localhost -m gce_img --args "${params}" --one-line | cut -f2- -d">"