#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_level+x}" ];
  then params="${params} level=\"${PT_level}\""
fi

if [ ! -z "${PT_privacy+x}" ];
  then params="${params} privacy=\"${PT_privacy}\""
fi

if [ ! -z "${PT_community+x}" ];
  then params="${params} community=\"${PT_community}\""
fi

if [ ! -z "${PT_authkey+x}" ];
  then params="${params} authkey=\"${PT_authkey}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_integrity+x}" ];
  then params="${params} integrity=\"${PT_integrity}\""
fi

if [ ! -z "${PT_privkey+x}" ];
  then params="${params} privkey=\"${PT_privkey}\""
fi

ansible localhost -m snmp_facts --args "${params}" --one-line | cut -f2- -d">"