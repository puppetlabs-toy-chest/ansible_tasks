#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_application_pool+x}" ];
  then params="${params} application_pool=\"${PT_application_pool}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_parameters+x}" ];
  then params="${params} parameters=\"${PT_parameters}\""
fi

if [ ! -z "${PT_ip+x}" ];
  then params="${params} ip=\"${PT_ip}\""
fi

if [ ! -z "${PT_physical_path+x}" ];
  then params="${params} physical_path=\"${PT_physical_path}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_site_id+x}" ];
  then params="${params} site_id=\"${PT_site_id}\""
fi

if [ ! -z "${PT_ssl+x}" ];
  then params="${params} ssl=\"${PT_ssl}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

ansible localhost -m win_iis_website --args "${params}" --one-line | cut -f2- -d">"