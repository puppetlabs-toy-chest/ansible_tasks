#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_sort_order+x}" ];
  then params="${params} sort_order=\"${PT_sort_order}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_name_regex+x}" ];
  then params="${params} name_regex=\"${PT_name_regex}\""
fi

if [ ! -z "${PT_limit+x}" ];
  then params="${params} limit=\"${PT_limit}\""
fi

ansible localhost -m ec2_lc_find --args "${params}" --one-line | cut -f2- -d">"