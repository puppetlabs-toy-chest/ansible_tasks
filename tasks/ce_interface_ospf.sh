#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_cost+x}" ];
  then params="${params} cost=\"${PT_cost}\""
fi

if [ ! -z "${PT_area+x}" ];
  then params="${params} area=\"${PT_area}\""
fi

if [ ! -z "${PT_silent_interface+x}" ];
  then params="${params} silent_interface=\"${PT_silent_interface}\""
fi

if [ ! -z "${PT_auth_mode+x}" ];
  then params="${params} auth_mode=\"${PT_auth_mode}\""
fi

if [ ! -z "${PT_auth_key_id+x}" ];
  then params="${params} auth_key_id=\"${PT_auth_key_id}\""
fi

if [ ! -z "${PT_dead_interval+x}" ];
  then params="${params} dead_interval=\"${PT_dead_interval}\""
fi

if [ ! -z "${PT_auth_text_simple+x}" ];
  then params="${params} auth_text_simple=\"${PT_auth_text_simple}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_process_id+x}" ];
  then params="${params} process_id=\"${PT_process_id}\""
fi

if [ ! -z "${PT_hello_interval+x}" ];
  then params="${params} hello_interval=\"${PT_hello_interval}\""
fi

if [ ! -z "${PT_auth_text_md5+x}" ];
  then params="${params} auth_text_md5=\"${PT_auth_text_md5}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

ansible localhost -m ce_interface_ospf --args "${params}" --one-line | cut -f2- -d">"