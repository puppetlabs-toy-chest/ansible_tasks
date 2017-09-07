#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_filter+x}" ];
  then params="${params} filter=\"${PT_filter}\""
fi

if [ ! -z "${PT_gather_subset+x}" ];
  then params="${params} gather_subset=\"${PT_gather_subset}\""
fi

if [ ! -z "${PT_fact_path+x}" ];
  then params="${params} fact_path=\"${PT_fact_path}\""
fi

if [ ! -z "${PT_gather_timeout+x}" ];
  then params="${params} gather_timeout=\"${PT_gather_timeout}\""
fi

ansible localhost -m setup --args "${params}" --one-line | cut -f2- -d">"