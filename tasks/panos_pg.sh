#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_wildfire+x}" ];
  then params="${params} wildfire=\"${PT_wildfire}\""
fi

if [ ! -z "${PT_data_filtering+x}" ];
  then params="${params} data_filtering=\"${PT_data_filtering}\""
fi

if [ ! -z "${PT_file_blocking+x}" ];
  then params="${params} file_blocking=\"${PT_file_blocking}\""
fi

if [ ! -z "${PT_pg_name+x}" ];
  then params="${params} pg_name=\"${PT_pg_name}\""
fi

if [ ! -z "${PT_vulnerability+x}" ];
  then params="${params} vulnerability=\"${PT_vulnerability}\""
fi

if [ ! -z "${PT_spyware+x}" ];
  then params="${params} spyware=\"${PT_spyware}\""
fi

if [ ! -z "${PT_url_filtering+x}" ];
  then params="${params} url_filtering=\"${PT_url_filtering}\""
fi

if [ ! -z "${PT_virus+x}" ];
  then params="${params} virus=\"${PT_virus}\""
fi

if [ ! -z "${PT_commit+x}" ];
  then params="${params} commit=\"${PT_commit}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_ip_address+x}" ];
  then params="${params} ip_address=\"${PT_ip_address}\""
fi

ansible localhost -m panos_pg --args "${params}" --one-line | cut -f2- -d">"