#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_fingerprint+x}" ];
  then params="${params} fingerprint=\"${PT_fingerprint}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
fi

if [ ! -z "${PT_auth_token+x}" ];
  then params="${params} auth_token=\"${PT_auth_token}\""
fi

if [ ! -z "${PT_key_file+x}" ];
  then params="${params} key_file=\"${PT_key_file}\""
fi

if [ ! -z "${PT_label+x}" ];
  then params="${params} label=\"${PT_label}\""
fi

ansible localhost -m packet_sshkey --args "${params}" --one-line | cut -f2- -d">"