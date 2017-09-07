#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_addrtype+x}" ];
  then params="${params} addrtype=\"${PT_addrtype}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_temporary+x}" ];
  then params="${params} temporary=\"${PT_temporary}\""
fi

if [ ! -z "${PT_address+x}" ];
  then params="${params} address=\"${PT_address}\""
fi

if [ ! -z "${PT_addrobj+x}" ];
  then params="${params} addrobj=\"${PT_addrobj}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

ansible localhost -m ipadm_addr --args "${params}" --one-line | cut -f2- -d">"