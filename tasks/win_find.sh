#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_paths+x}" ];
  then params="${params} paths=\"${PT_paths}\""
fi

if [ ! -z "${PT_file_type+x}" ];
  then params="${params} file_type=\"${PT_file_type}\""
fi

if [ ! -z "${PT_checksum_algorithm+x}" ];
  then params="${params} checksum_algorithm=\"${PT_checksum_algorithm}\""
fi

if [ ! -z "${PT_age+x}" ];
  then params="${params} age=\"${PT_age}\""
fi

if [ ! -z "${PT_recurse+x}" ];
  then params="${params} recurse=\"${PT_recurse}\""
fi

if [ ! -z "${PT_age_stamp+x}" ];
  then params="${params} age_stamp=\"${PT_age_stamp}\""
fi

if [ ! -z "${PT_patterns+x}" ];
  then params="${params} patterns=\"${PT_patterns}\""
fi

if [ ! -z "${PT_get_checksum+x}" ];
  then params="${params} get_checksum=\"${PT_get_checksum}\""
fi

if [ ! -z "${PT_use_regex+x}" ];
  then params="${params} use_regex=\"${PT_use_regex}\""
fi

if [ ! -z "${PT_follow+x}" ];
  then params="${params} follow=\"${PT_follow}\""
fi

if [ ! -z "${PT_hidden+x}" ];
  then params="${params} hidden=\"${PT_hidden}\""
fi

if [ ! -z "${PT_size+x}" ];
  then params="${params} size=\"${PT_size}\""
fi

ansible localhost -m win_find --args "${params}" --one-line | cut -f2- -d">"