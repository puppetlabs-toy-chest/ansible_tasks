#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_auth_type+x}" ];
  then params="${params} auth_type=\"${PT_auth_type}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_auth_pwd+x}" ];
  then params="${params} auth_pwd=\"${PT_auth_pwd}\""
fi

if [ ! -z "${PT_key_id+x}" ];
  then params="${params} key_id=\"${PT_key_id}\""
fi

if [ ! -z "${PT_trusted_key+x}" ];
  then params="${params} trusted_key=\"${PT_trusted_key}\""
fi

if [ ! -z "${PT_auth_mode+x}" ];
  then params="${params} auth_mode=\"${PT_auth_mode}\""
fi

if [ ! -z "${PT_authentication+x}" ];
  then params="${params} authentication=\"${PT_authentication}\""
fi

ansible localhost -m ce_ntp_auth --args "${params}" --one-line | cut -f2- -d">"