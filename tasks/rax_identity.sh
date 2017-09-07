#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_identity_type+x}" ];
  then params="${params} identity_type=\"${PT_identity_type}\""
fi

if [ ! -z "${PT_tenant_id+x}" ];
  then params="${params} tenant_id=\"${PT_tenant_id}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_verify_ssl+x}" ];
  then params="${params} verify_ssl=\"${PT_verify_ssl}\""
fi

if [ ! -z "${PT_env+x}" ];
  then params="${params} env=\"${PT_env}\""
fi

if [ ! -z "${PT_tenant_name+x}" ];
  then params="${params} tenant_name=\"${PT_tenant_name}\""
fi

if [ ! -z "${PT_credentials+x}" ];
  then params="${params} credentials=\"${PT_credentials}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_auth_endpoint+x}" ];
  then params="${params} auth_endpoint=\"${PT_auth_endpoint}\""
fi

ansible localhost -m rax_identity --args "${params}" --one-line | cut -f2- -d">"