#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_repo+x}" ];
  then params="${params} repo=\"${PT_repo}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_auto_import_keys+x}" ];
  then params="${params} auto_import_keys=\"${PT_auto_import_keys}\""
fi

if [ ! -z "${PT_enabled+x}" ];
  then params="${params} enabled=\"${PT_enabled}\""
fi

if [ ! -z "${PT_disable_gpg_check+x}" ];
  then params="${params} disable_gpg_check=\"${PT_disable_gpg_check}\""
fi

if [ ! -z "${PT_priority+x}" ];
  then params="${params} priority=\"${PT_priority}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_autorefresh+x}" ];
  then params="${params} autorefresh=\"${PT_autorefresh}\""
fi

if [ ! -z "${PT_overwrite_multiple+x}" ];
  then params="${params} overwrite_multiple=\"${PT_overwrite_multiple}\""
fi

if [ ! -z "${PT_runrefresh+x}" ];
  then params="${params} runrefresh=\"${PT_runrefresh}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

ansible localhost -m zypper_repository --args "${params}" --one-line | cut -f2- -d">"