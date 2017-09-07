#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_certfile+x}" ];
  then params="${params} certfile=\"${PT_certfile}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_topic+x}" ];
  then params="${params} topic=\"${PT_topic}\""
fi

if [ ! -z "${PT_client_id+x}" ];
  then params="${params} client_id=\"${PT_client_id}\""
fi

if [ ! -z "${PT_ca_certs+x}" ];
  then params="${params} ca_certs=\"${PT_ca_certs}\""
fi

if [ ! -z "${PT_retain+x}" ];
  then params="${params} retain=\"${PT_retain}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_keyfile+x}" ];
  then params="${params} keyfile=\"${PT_keyfile}\""
fi

if [ ! -z "${PT_payload+x}" ];
  then params="${params} payload=\"${PT_payload}\""
fi

if [ ! -z "${PT_qos+x}" ];
  then params="${params} qos=\"${PT_qos}\""
fi

ansible localhost -m mqtt --args "${params}" --one-line | cut -f2- -d">"