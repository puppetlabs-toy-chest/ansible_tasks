#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_metric+x}" ];
  then params="${params} metric=\"${PT_metric}\""
fi

if [ ! -z "${PT_alert_recipients+x}" ];
  then params="${params} alert_recipients=\"${PT_alert_recipients}\""
fi

if [ ! -z "${PT_alias+x}" ];
  then params="${params} alias=\"${PT_alias}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_threshold+x}" ];
  then params="${params} threshold=\"${PT_threshold}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
fi

if [ ! -z "${PT_duration+x}" ];
  then params="${params} duration=\"${PT_duration}\""
fi

ansible localhost -m clc_alert_policy --args "${params}" --one-line | cut -f2- -d">"