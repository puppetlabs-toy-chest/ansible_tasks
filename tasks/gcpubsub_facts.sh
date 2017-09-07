#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_topic+x}" ];
  then params="${params} topic=\"${PT_topic}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_view+x}" ];
  then params="${params} view=\"${PT_view}\""
fi

ansible localhost -m gcpubsub_facts --args "${params}" --one-line | cut -f2- -d">"