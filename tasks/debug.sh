#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_var+x}" ];
  then params="${params} var=\"${PT_var}\""
fi

if [ ! -z "${PT_verbosity+x}" ];
  then params="${params} verbosity=\"${PT_verbosity}\""
fi

ansible localhost -m debug --args "${params}" --one-line | cut -f2- -d">"