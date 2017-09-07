#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_instance_name+x}" ];
  then params="${params} instance_name=\"${PT_instance_name}\""
fi

if [ ! -z "${PT_project_id+x}" ];
  then params="${params} project_id=\"${PT_project_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_snapshot_name+x}" ];
  then params="${params} snapshot_name=\"${PT_snapshot_name}\""
fi

if [ ! -z "${PT_credentials_file+x}" ];
  then params="${params} credentials_file=\"${PT_credentials_file}\""
fi

if [ ! -z "${PT_service_account_email+x}" ];
  then params="${params} service_account_email=\"${PT_service_account_email}\""
fi

if [ ! -z "${PT_disks+x}" ];
  then params="${params} disks=\"${PT_disks}\""
fi

ansible localhost -m gce_snapshot --args "${params}" --one-line | cut -f2- -d">"