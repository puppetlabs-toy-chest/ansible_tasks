#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_content+x}" ];
  then params="${params} content=\"${PT_content}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_session+x}" ];
  then params="${params} session=\"${PT_session}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_loopback+x}" ];
  then params="${params} loopback=\"${PT_loopback}\""
fi

if [ ! -z "${PT_asn+x}" ];
  then params="${params} asn=\"${PT_asn}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
fi

ansible localhost -m aos_external_router --args "${params}" --one-line | cut -f2- -d">"