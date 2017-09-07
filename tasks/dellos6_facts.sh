#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_gather_subset+x}" ];
  then params="${params} gather_subset=\"${PT_gather_subset}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

ansible localhost -m dellos6_facts --args "${params}" --one-line | cut -f2- -d">"