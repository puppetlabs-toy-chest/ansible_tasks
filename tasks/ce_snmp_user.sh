#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_priv_key+x}" ];
  then params="${params} priv_key=\"${PT_priv_key}\""
fi

if [ ! -z "${PT_aaa_local_user+x}" ];
  then params="${params} aaa_local_user=\"${PT_aaa_local_user}\""
fi

if [ ! -z "${PT_auth_key+x}" ];
  then params="${params} auth_key=\"${PT_auth_key}\""
fi

if [ ! -z "${PT_usm_user_name+x}" ];
  then params="${params} usm_user_name=\"${PT_usm_user_name}\""
fi

if [ ! -z "${PT_acl_number+x}" ];
  then params="${params} acl_number=\"${PT_acl_number}\""
fi

if [ ! -z "${PT_auth_protocol+x}" ];
  then params="${params} auth_protocol=\"${PT_auth_protocol}\""
fi

if [ ! -z "${PT_remote_engine_id+x}" ];
  then params="${params} remote_engine_id=\"${PT_remote_engine_id}\""
fi

if [ ! -z "${PT_priv_protocol+x}" ];
  then params="${params} priv_protocol=\"${PT_priv_protocol}\""
fi

if [ ! -z "${PT_user_group+x}" ];
  then params="${params} user_group=\"${PT_user_group}\""
fi

ansible localhost -m ce_snmp_user --args "${params}" --one-line | cut -f2- -d">"