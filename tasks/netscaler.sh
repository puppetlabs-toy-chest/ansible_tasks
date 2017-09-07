#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_nsc_protocol+x}" ];
  then params="${params} nsc_protocol=\"${PT_nsc_protocol}\""
fi

if [ ! -z "${PT_nsc_host+x}" ];
  then params="${params} nsc_host=\"${PT_nsc_host}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_action+x}" ];
  then params="${params} action=\"${PT_action}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m netscaler --args "${params}" --one-line | cut -f2- -d">"