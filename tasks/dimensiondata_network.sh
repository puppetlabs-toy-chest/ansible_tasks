#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_service_plan+x}" ];
  then params="${params} service_plan=\"${PT_service_plan}\""
fi

if [ ! -z "${PT_mcp_user+x}" ];
  then params="${params} mcp_user=\"${PT_mcp_user}\""
fi

if [ ! -z "${PT_wait_poll_interval+x}" ];
  then params="${params} wait_poll_interval=\"${PT_wait_poll_interval}\""
fi

if [ ! -z "${PT_mcp_password+x}" ];
  then params="${params} mcp_password=\"${PT_mcp_password}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_wait_time+x}" ];
  then params="${params} wait_time=\"${PT_wait_time}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

ansible localhost -m dimensiondata_network --args "${params}" --one-line | cut -f2- -d">"