#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_size_gb+x}" ];
  then params="${params} size_gb=\"${PT_size_gb}\""
fi

if [ ! -z "${PT_project_id+x}" ];
  then params="${params} project_id=\"${PT_project_id}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_service_account_email+x}" ];
  then params="${params} service_account_email=\"${PT_service_account_email}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_pem_file+x}" ];
  then params="${params} pem_file=\"${PT_pem_file}\""
fi

if [ ! -z "${PT_instance_name+x}" ];
  then params="${params} instance_name=\"${PT_instance_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_snapshot+x}" ];
  then params="${params} snapshot=\"${PT_snapshot}\""
fi

if [ ! -z "${PT_detach_only+x}" ];
  then params="${params} detach_only=\"${PT_detach_only}\""
fi

if [ ! -z "${PT_credentials_file+x}" ];
  then params="${params} credentials_file=\"${PT_credentials_file}\""
fi

if [ ! -z "${PT_disk_type+x}" ];
  then params="${params} disk_type=\"${PT_disk_type}\""
fi

if [ ! -z "${PT_delete_on_termination+x}" ];
  then params="${params} delete_on_termination=\"${PT_delete_on_termination}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

ansible localhost -m gce_pd --args "${params}" --one-line | cut -f2- -d">"