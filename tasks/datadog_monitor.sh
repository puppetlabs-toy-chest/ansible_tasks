#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_notify_audit+x}" ];
  then params="${params} notify_audit=\"${PT_notify_audit}\""
fi

if [ ! -z "${PT_timeout_h+x}" ];
  then params="${params} timeout_h=\"${PT_timeout_h}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_thresholds+x}" ];
  then params="${params} thresholds=\"${PT_thresholds}\""
fi

if [ ! -z "${PT_app_key+x}" ];
  then params="${params} app_key=\"${PT_app_key}\""
fi

if [ ! -z "${PT_query+x}" ];
  then params="${params} query=\"${PT_query}\""
fi

if [ ! -z "${PT_message+x}" ];
  then params="${params} message=\"${PT_message}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
fi

if [ ! -z "${PT_locked+x}" ];
  then params="${params} locked=\"${PT_locked}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_no_data_timeframe+x}" ];
  then params="${params} no_data_timeframe=\"${PT_no_data_timeframe}\""
fi

if [ ! -z "${PT_silenced+x}" ];
  then params="${params} silenced=\"${PT_silenced}\""
fi

if [ ! -z "${PT_require_full_window+x}" ];
  then params="${params} require_full_window=\"${PT_require_full_window}\""
fi

if [ ! -z "${PT_notify_no_data+x}" ];
  then params="${params} notify_no_data=\"${PT_notify_no_data}\""
fi

if [ ! -z "${PT_renotify_interval+x}" ];
  then params="${params} renotify_interval=\"${PT_renotify_interval}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_escalation_message+x}" ];
  then params="${params} escalation_message=\"${PT_escalation_message}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

ansible localhost -m datadog_monitor --args "${params}" --one-line | cut -f2- -d">"