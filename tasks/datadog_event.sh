#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_date_happened+x}" ];
  then params="${params} date_happened=\"${PT_date_happened}\""
fi

if [ ! -z "${PT_alert_type+x}" ];
  then params="${params} alert_type=\"${PT_alert_type}\""
fi

if [ ! -z "${PT_title+x}" ];
  then params="${params} title=\"${PT_title}\""
fi

if [ ! -z "${PT_text+x}" ];
  then params="${params} text=\"${PT_text}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_app_key+x}" ];
  then params="${params} app_key=\"${PT_app_key}\""
fi

if [ ! -z "${PT_priority+x}" ];
  then params="${params} priority=\"${PT_priority}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_aggregation_key+x}" ];
  then params="${params} aggregation_key=\"${PT_aggregation_key}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m datadog_event --args "${params}" --one-line | cut -f2- -d">"