#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_solo+x}" ];
  then params="${params} solo=\"${PT_solo}\""
fi

if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_account_email+x}" ];
  then params="${params} account_email=\"${PT_account_email}\""
fi

if [ ! -z "${PT_record_ids+x}" ];
  then params="${params} record_ids=\"${PT_record_ids}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

if [ ! -z "${PT_priority+x}" ];
  then params="${params} priority=\"${PT_priority}\""
fi

if [ ! -z "${PT_record+x}" ];
  then params="${params} record=\"${PT_record}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_ttl+x}" ];
  then params="${params} ttl=\"${PT_ttl}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_account_api_token+x}" ];
  then params="${params} account_api_token=\"${PT_account_api_token}\""
fi

ansible localhost -m dnsimple --args "${params}" --one-line | cut -f2- -d">"