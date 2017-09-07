#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_creates+x}" ];
  then params="${params} creates=\"${PT_creates}\""
fi

if [ ! -z "${PT_chdir+x}" ];
  then params="${params} chdir=\"${PT_chdir}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_responses+x}" ];
  then params="${params} responses=\"${PT_responses}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_removes+x}" ];
  then params="${params} removes=\"${PT_removes}\""
fi

if [ ! -z "${PT_echo+x}" ];
  then params="${params} echo=\"${PT_echo}\""
fi

ansible localhost -m expect --args "${params}" --one-line | cut -f2- -d">"