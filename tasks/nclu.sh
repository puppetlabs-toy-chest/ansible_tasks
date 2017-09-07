#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_commands+x}" ];
  then params="${params} commands=\"${PT_commands}\""
fi

if [ ! -z "${PT_abort+x}" ];
  then params="${params} abort=\"${PT_abort}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_template+x}" ];
  then params="${params} template=\"${PT_template}\""
fi

if [ ! -z "${PT_commit+x}" ];
  then params="${params} commit=\"${PT_commit}\""
fi

if [ ! -z "${PT_atomic+x}" ];
  then params="${params} atomic=\"${PT_atomic}\""
fi

ansible localhost -m nclu --args "${params}" --one-line | cut -f2- -d">"