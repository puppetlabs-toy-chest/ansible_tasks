#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_private+x}" ];
  then params="${params} private=\"${PT_private}\""
fi

if [ ! -z "${PT_verify_ssl+x}" ];
  then params="${params} verify_ssl=\"${PT_verify_ssl}\""
fi

if [ ! -z "${PT_clear_meta+x}" ];
  then params="${params} clear_meta=\"${PT_clear_meta}\""
fi

if [ ! -z "${PT_ttl+x}" ];
  then params="${params} ttl=\"${PT_ttl}\""
fi

if [ ! -z "${PT_credentials+x}" ];
  then params="${params} credentials=\"${PT_credentials}\""
fi

if [ ! -z "${PT_web_index+x}" ];
  then params="${params} web_index=\"${PT_web_index}\""
fi

if [ ! -z "${PT_container+x}" ];
  then params="${params} container=\"${PT_container}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_meta+x}" ];
  then params="${params} meta=\"${PT_meta}\""
fi

if [ ! -z "${PT_env+x}" ];
  then params="${params} env=\"${PT_env}\""
fi

if [ ! -z "${PT_web_error+x}" ];
  then params="${params} web_error=\"${PT_web_error}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_public+x}" ];
  then params="${params} public=\"${PT_public}\""
fi

ansible localhost -m rax_files --args "${params}" --one-line | cut -f2- -d">"