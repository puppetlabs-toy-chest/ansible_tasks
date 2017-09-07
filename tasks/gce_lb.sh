#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_httphealthcheck_host+x}" ];
  then params="${params} httphealthcheck_host=\"${PT_httphealthcheck_host}\""
fi

if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
fi

if [ ! -z "${PT_pem_file+x}" ];
  then params="${params} pem_file=\"${PT_pem_file}\""
fi

if [ ! -z "${PT_members+x}" ];
  then params="${params} members=\"${PT_members}\""
fi

if [ ! -z "${PT_httphealthcheck_port+x}" ];
  then params="${params} httphealthcheck_port=\"${PT_httphealthcheck_port}\""
fi

if [ ! -z "${PT_httphealthcheck_name+x}" ];
  then params="${params} httphealthcheck_name=\"${PT_httphealthcheck_name}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_external_ip+x}" ];
  then params="${params} external_ip=\"${PT_external_ip}\""
fi

if [ ! -z "${PT_service_account_email+x}" ];
  then params="${params} service_account_email=\"${PT_service_account_email}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_httphealthcheck_unhealthy_count+x}" ];
  then params="${params} httphealthcheck_unhealthy_count=\"${PT_httphealthcheck_unhealthy_count}\""
fi

if [ ! -z "${PT_httphealthcheck_healthy_count+x}" ];
  then params="${params} httphealthcheck_healthy_count=\"${PT_httphealthcheck_healthy_count}\""
fi

if [ ! -z "${PT_httphealthcheck_path+x}" ];
  then params="${params} httphealthcheck_path=\"${PT_httphealthcheck_path}\""
fi

if [ ! -z "${PT_port_range+x}" ];
  then params="${params} port_range=\"${PT_port_range}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_httphealthcheck_timeout+x}" ];
  then params="${params} httphealthcheck_timeout=\"${PT_httphealthcheck_timeout}\""
fi

if [ ! -z "${PT_credentials_file+x}" ];
  then params="${params} credentials_file=\"${PT_credentials_file}\""
fi

if [ ! -z "${PT_project_id+x}" ];
  then params="${params} project_id=\"${PT_project_id}\""
fi

if [ ! -z "${PT_httphealthcheck_interval+x}" ];
  then params="${params} httphealthcheck_interval=\"${PT_httphealthcheck_interval}\""
fi

ansible localhost -m gce_lb --args "${params}" --one-line | cut -f2- -d">"