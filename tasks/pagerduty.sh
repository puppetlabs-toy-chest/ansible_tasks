#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_service+x}" ];
  then params="${params} service=\"${PT_service}\""
fi

if [ ! -z "${PT_passwd+x}" ];
  then params="${params} passwd=\"${PT_passwd}\""
fi

if [ ! -z "${PT_minutes+x}" ];
  then params="${params} minutes=\"${PT_minutes}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_hours+x}" ];
  then params="${params} hours=\"${PT_hours}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_requester_id+x}" ];
  then params="${params} requester_id=\"${PT_requester_id}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_desc+x}" ];
  then params="${params} desc=\"${PT_desc}\""
fi

ansible localhost -m pagerduty --args "${params}" --one-line | cut -f2- -d">"