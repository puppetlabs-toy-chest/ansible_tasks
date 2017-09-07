#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_verify_ssl+x}" ];
  then params="${params} verify_ssl=\"${PT_verify_ssl}\""
fi

if [ ! -z "${PT_ttl+x}" ];
  then params="${params} ttl=\"${PT_ttl}\""
fi

if [ ! -z "${PT_credentials+x}" ];
  then params="${params} credentials=\"${PT_credentials}\""
fi

if [ ! -z "${PT_data+x}" ];
  then params="${params} data=\"${PT_data}\""
fi

if [ ! -z "${PT_overwrite+x}" ];
  then params="${params} overwrite=\"${PT_overwrite}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_priority+x}" ];
  then params="${params} priority=\"${PT_priority}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_env+x}" ];
  then params="${params} env=\"${PT_env}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_loadbalancer+x}" ];
  then params="${params} loadbalancer=\"${PT_loadbalancer}\""
fi

ansible localhost -m rax_dns_record --args "${params}" --one-line | cut -f2- -d">"