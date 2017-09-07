#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_private_key+x}" ];
  then params="${params} private_key=\"${PT_private_key}\""
fi

if [ ! -z "${PT_https_redirect+x}" ];
  then params="${params} https_redirect=\"${PT_https_redirect}\""
fi

if [ ! -z "${PT_verify_ssl+x}" ];
  then params="${params} verify_ssl=\"${PT_verify_ssl}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_credentials+x}" ];
  then params="${params} credentials=\"${PT_credentials}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_certificate+x}" ];
  then params="${params} certificate=\"${PT_certificate}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_enabled+x}" ];
  then params="${params} enabled=\"${PT_enabled}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_intermediate_certificate+x}" ];
  then params="${params} intermediate_certificate=\"${PT_intermediate_certificate}\""
fi

if [ ! -z "${PT_secure_port+x}" ];
  then params="${params} secure_port=\"${PT_secure_port}\""
fi

if [ ! -z "${PT_secure_traffic_only+x}" ];
  then params="${params} secure_traffic_only=\"${PT_secure_traffic_only}\""
fi

if [ ! -z "${PT_env+x}" ];
  then params="${params} env=\"${PT_env}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_loadbalancer+x}" ];
  then params="${params} loadbalancer=\"${PT_loadbalancer}\""
fi

ansible localhost -m rax_clb_ssl --args "${params}" --one-line | cut -f2- -d">"