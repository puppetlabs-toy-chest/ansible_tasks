#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_key_content+x}" ];
  then params="${params} key_content=\"${PT_key_content}\""
fi

if [ ! -z "${PT_partition+x}" ];
  then params="${params} partition=\"${PT_partition}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_cert_src+x}" ];
  then params="${params} cert_src=\"${PT_cert_src}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_server_port+x}" ];
  then params="${params} server_port=\"${PT_server_port}\""
fi

if [ ! -z "${PT_cert_content+x}" ];
  then params="${params} cert_content=\"${PT_cert_content}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_passphrase+x}" ];
  then params="${params} passphrase=\"${PT_passphrase}\""
fi

if [ ! -z "${PT_key_src+x}" ];
  then params="${params} key_src=\"${PT_key_src}\""
fi

ansible localhost -m bigip_ssl_certificate --args "${params}" --one-line | cut -f2- -d">"