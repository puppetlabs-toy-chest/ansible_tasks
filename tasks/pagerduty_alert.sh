#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_client_url+x}" ];
  then params="${params} client_url=\"${PT_client_url}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_incident_key+x}" ];
  then params="${params} incident_key=\"${PT_incident_key}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_client+x}" ];
  then params="${params} client=\"${PT_client}\""
fi

if [ ! -z "${PT_service_key+x}" ];
  then params="${params} service_key=\"${PT_service_key}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_desc+x}" ];
  then params="${params} desc=\"${PT_desc}\""
fi

ansible localhost -m pagerduty_alert --args "${params}" --one-line | cut -f2- -d">"