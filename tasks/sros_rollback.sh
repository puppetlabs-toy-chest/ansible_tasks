#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_rescue_location+x}" ];
  then params="${params} rescue_location=\"${PT_rescue_location}\""
fi

if [ ! -z "${PT_remote_max_checkpoints+x}" ];
  then params="${params} remote_max_checkpoints=\"${PT_remote_max_checkpoints}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_local_max_checkpoints+x}" ];
  then params="${params} local_max_checkpoints=\"${PT_local_max_checkpoints}\""
fi

if [ ! -z "${PT_rollback_location+x}" ];
  then params="${params} rollback_location=\"${PT_rollback_location}\""
fi

ansible localhost -m sros_rollback --args "${params}" --one-line | cut -f2- -d">"