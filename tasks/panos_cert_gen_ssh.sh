#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_rsa_nbits+x}" ];
  then params="${params} rsa_nbits=\"${PT_rsa_nbits}\""
fi

if [ ! -z "${PT_cert_cn+x}" ];
  then params="${params} cert_cn=\"${PT_cert_cn}\""
fi

if [ ! -z "${PT_cert_friendly_name+x}" ];
  then params="${params} cert_friendly_name=\"${PT_cert_friendly_name}\""
fi

if [ ! -z "${PT_key_filename+x}" ];
  then params="${params} key_filename=\"${PT_key_filename}\""
fi

if [ ! -z "${PT_ip_address+x}" ];
  then params="${params} ip_address=\"${PT_ip_address}\""
fi

if [ ! -z "${PT_signed_by+x}" ];
  then params="${params} signed_by=\"${PT_signed_by}\""
fi

ansible localhost -m panos_cert_gen_ssh --args "${params}" --one-line | cut -f2- -d">"