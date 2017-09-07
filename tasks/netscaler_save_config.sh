#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_nitro_protocol+x}" ];
  then params="${params} nitro_protocol=\"${PT_nitro_protocol}\""
fi

if [ ! -z "${PT_nsip+x}" ];
  then params="${params} nsip=\"${PT_nsip}\""
fi

if [ ! -z "${PT_nitro_user+x}" ];
  then params="${params} nitro_user=\"${PT_nitro_user}\""
fi

if [ ! -z "${PT_nitro_pass+x}" ];
  then params="${params} nitro_pass=\"${PT_nitro_pass}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_nitro_timeout+x}" ];
  then params="${params} nitro_timeout=\"${PT_nitro_timeout}\""
fi

ansible localhost -m netscaler_save_config --args "${params}" --one-line | cut -f2- -d">"