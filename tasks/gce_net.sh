#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_src_tags+x}" ];
  then params="${params} src_tags=\"${PT_src_tags}\""
fi

if [ ! -z "${PT_subnet_region+x}" ];
  then params="${params} subnet_region=\"${PT_subnet_region}\""
fi

if [ ! -z "${PT_ipv4_range+x}" ];
  then params="${params} ipv4_range=\"${PT_ipv4_range}\""
fi

if [ ! -z "${PT_pem_file+x}" ];
  then params="${params} pem_file=\"${PT_pem_file}\""
fi

if [ ! -z "${PT_target_tags+x}" ];
  then params="${params} target_tags=\"${PT_target_tags}\""
fi

if [ ! -z "${PT_allowed+x}" ];
  then params="${params} allowed=\"${PT_allowed}\""
fi

if [ ! -z "${PT_fwname+x}" ];
  then params="${params} fwname=\"${PT_fwname}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_src_range+x}" ];
  then params="${params} src_range=\"${PT_src_range}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_subnet_name+x}" ];
  then params="${params} subnet_name=\"${PT_subnet_name}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_credentials_file+x}" ];
  then params="${params} credentials_file=\"${PT_credentials_file}\""
fi

if [ ! -z "${PT_service_account_email+x}" ];
  then params="${params} service_account_email=\"${PT_service_account_email}\""
fi

if [ ! -z "${PT_project_id+x}" ];
  then params="${params} project_id=\"${PT_project_id}\""
fi

if [ ! -z "${PT_subnet_desc+x}" ];
  then params="${params} subnet_desc=\"${PT_subnet_desc}\""
fi

ansible localhost -m gce_net --args "${params}" --one-line | cut -f2- -d">"