#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_keystore_create+x}" ];
  then params="${params} keystore_create=\"${PT_keystore_create}\""
fi

if [ ! -z "${PT_cert_alias+x}" ];
  then params="${params} cert_alias=\"${PT_cert_alias}\""
fi

if [ ! -z "${PT_executable+x}" ];
  then params="${params} executable=\"${PT_executable}\""
fi

if [ ! -z "${PT_cert_port+x}" ];
  then params="${params} cert_port=\"${PT_cert_port}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_keystore_pass+x}" ];
  then params="${params} keystore_pass=\"${PT_keystore_pass}\""
fi

if [ ! -z "${PT_cert_url+x}" ];
  then params="${params} cert_url=\"${PT_cert_url}\""
fi

if [ ! -z "${PT_cert_path+x}" ];
  then params="${params} cert_path=\"${PT_cert_path}\""
fi

if [ ! -z "${PT_keystore_path+x}" ];
  then params="${params} keystore_path=\"${PT_keystore_path}\""
fi

ansible localhost -m java_cert --args "${params}" --one-line | cut -f2- -d">"