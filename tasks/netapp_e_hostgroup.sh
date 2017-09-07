#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_new_name+x}" ];
  then params="${params} new_name=\"${PT_new_name}\""
fi

if [ ! -z "${PT_ssid+x}" ];
  then params="${params} ssid=\"${PT_ssid}\""
fi

if [ ! -z "${PT_api_password+x}" ];
  then params="${params} api_password=\"${PT_api_password}\""
fi

if [ ! -z "${PT_hosts:+x}" ];
  then params="${params} hosts:=\"${PT_hosts:}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_api_username+x}" ];
  then params="${params} api_username=\"${PT_api_username}\""
fi

if [ ! -z "${PT_api_url+x}" ];
  then params="${params} api_url=\"${PT_api_url}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

ansible localhost -m netapp_e_hostgroup --args "${params}" --one-line | cut -f2- -d">"