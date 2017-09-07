#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_url_password+x}" ];
  then params="${params} url_password=\"${PT_url_password}\""
fi

if [ ! -z "${PT_certificate_authority_data+x}" ];
  then params="${params} certificate_authority_data=\"${PT_certificate_authority_data}\""
fi

if [ ! -z "${PT_inline_data+x}" ];
  then params="${params} inline_data=\"${PT_inline_data}\""
fi

if [ ! -z "${PT_insecure+x}" ];
  then params="${params} insecure=\"${PT_insecure}\""
fi

if [ ! -z "${PT_file_reference+x}" ];
  then params="${params} file_reference=\"${PT_file_reference}\""
fi

if [ ! -z "${PT_api_endpoint+x}" ];
  then params="${params} api_endpoint=\"${PT_api_endpoint}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_url_username+x}" ];
  then params="${params} url_username=\"${PT_url_username}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m kubernetes --args "${params}" --one-line | cut -f2- -d">"