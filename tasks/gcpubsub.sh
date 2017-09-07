#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_pull+x}" ];
  then params="${params} pull=\"${PT_pull}\""
fi

if [ ! -z "${PT_ack_deadline+x}" ];
  then params="${params} ack_deadline=\"${PT_ack_deadline}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_publish+x}" ];
  then params="${params} publish=\"${PT_publish}\""
fi

if [ ! -z "${PT_topic+x}" ];
  then params="${params} topic=\"${PT_topic}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_push_endpoint+x}" ];
  then params="${params} push_endpoint=\"${PT_push_endpoint}\""
fi

if [ ! -z "${PT_subscription+x}" ];
  then params="${params} subscription=\"${PT_subscription}\""
fi

ansible localhost -m gcpubsub --args "${params}" --one-line | cut -f2- -d">"