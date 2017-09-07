#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_addr+x}" ];
  then params="${params} addr=\"${PT_addr}\""
fi

if [ ! -z "${PT_area+x}" ];
  then params="${params} area=\"${PT_area}\""
fi

if [ ! -z "${PT_max_load_balance+x}" ];
  then params="${params} max_load_balance=\"${PT_max_load_balance}\""
fi

if [ ! -z "${PT_mask+x}" ];
  then params="${params} mask=\"${PT_mask}\""
fi

if [ ! -z "${PT_auth_mode+x}" ];
  then params="${params} auth_mode=\"${PT_auth_mode}\""
fi

if [ ! -z "${PT_auth_key_id+x}" ];
  then params="${params} auth_key_id=\"${PT_auth_key_id}\""
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

if [ ! -z "${PT_nexthop_addr+x}" ];
  then params="${params} nexthop_addr=\"${PT_nexthop_addr}\""
fi

if [ ! -z "${PT_auth_text_md5+x}" ];
  then params="${params} auth_text_md5=\"${PT_auth_text_md5}\""
fi

if [ ! -z "${PT_nexthop_weight+x}" ];
  then params="${params} nexthop_weight=\"${PT_nexthop_weight}\""
fi

ansible localhost -m ce_ospf --args "${params}" --one-line | cut -f2- -d">"