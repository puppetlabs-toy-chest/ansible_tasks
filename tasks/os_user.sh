#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_auth_type+x}" ];
  then params="${params} auth_type=\"${PT_auth_type}\""
fi

if [ ! -z "${PT_update_password+x}" ];
  then params="${params} update_password=\"${PT_update_password}\""
fi

if [ ! -z "${PT_region_name+x}" ];
  then params="${params} region_name=\"${PT_region_name}\""
fi

if [ ! -z "${PT_availability_zone+x}" ];
  then params="${params} availability_zone=\"${PT_availability_zone}\""
fi

if [ ! -z "${PT_api_timeout+x}" ];
  then params="${params} api_timeout=\"${PT_api_timeout}\""
fi

if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_endpoint_type+x}" ];
  then params="${params} endpoint_type=\"${PT_endpoint_type}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_cacert+x}" ];
  then params="${params} cacert=\"${PT_cacert}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_cloud+x}" ];
  then params="${params} cloud=\"${PT_cloud}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_default_project+x}" ];
  then params="${params} default_project=\"${PT_default_project}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_enabled+x}" ];
  then params="${params} enabled=\"${PT_enabled}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_cert+x}" ];
  then params="${params} cert=\"${PT_cert}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_email+x}" ];
  then params="${params} email=\"${PT_email}\""
fi

ansible localhost -m os_user --args "${params}" --one-line | cut -f2- -d">"