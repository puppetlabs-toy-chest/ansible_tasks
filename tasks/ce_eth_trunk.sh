#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_members+x}" ];
  then params="${params} members=\"${PT_members}\""
fi

if [ ! -z "${PT_min_links+x}" ];
  then params="${params} min_links=\"${PT_min_links}\""
fi

if [ ! -z "${PT_trunk_id+x}" ];
  then params="${params} trunk_id=\"${PT_trunk_id}\""
fi

if [ ! -z "${PT_hash_type+x}" ];
  then params="${params} hash_type=\"${PT_hash_type}\""
fi

ansible localhost -m ce_eth_trunk --args "${params}" --one-line | cut -f2- -d">"