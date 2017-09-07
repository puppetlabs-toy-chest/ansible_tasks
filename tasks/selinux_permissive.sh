#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_no_reload+x}" ];
  then params="${params} no_reload=\"${PT_no_reload}\""
fi

if [ ! -z "${PT_store+x}" ];
  then params="${params} store=\"${PT_store}\""
fi

if [ ! -z "${PT_permissive+x}" ];
  then params="${params} permissive=\"${PT_permissive}\""
fi

ansible localhost -m selinux_permissive --args "${params}" --one-line | cut -f2- -d">"