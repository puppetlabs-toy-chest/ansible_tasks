#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_commit_id+x}" ];
  then params="${params} commit_id=\"${PT_commit_id}\""
fi

if [ ! -z "${PT_oldest+x}" ];
  then params="${params} oldest=\"${PT_oldest}\""
fi

if [ ! -z "${PT_last+x}" ];
  then params="${params} last=\"${PT_last}\""
fi

if [ ! -z "${PT_action+x}" ];
  then params="${params} action=\"${PT_action}\""
fi

if [ ! -z "${PT_filename+x}" ];
  then params="${params} filename=\"${PT_filename}\""
fi

if [ ! -z "${PT_label+x}" ];
  then params="${params} label=\"${PT_label}\""
fi

ansible localhost -m ce_rollback --args "${params}" --one-line | cut -f2- -d">"