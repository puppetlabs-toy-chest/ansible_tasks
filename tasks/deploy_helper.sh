#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_unfinished_filename+x}" ];
  then params="${params} unfinished_filename=\"${PT_unfinished_filename}\""
fi

if [ ! -z "${PT_keep_releases+x}" ];
  then params="${params} keep_releases=\"${PT_keep_releases}\""
fi

if [ ! -z "${PT_current_path+x}" ];
  then params="${params} current_path=\"${PT_current_path}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_shared_path+x}" ];
  then params="${params} shared_path=\"${PT_shared_path}\""
fi

if [ ! -z "${PT_releases_path+x}" ];
  then params="${params} releases_path=\"${PT_releases_path}\""
fi

if [ ! -z "${PT_clean+x}" ];
  then params="${params} clean=\"${PT_clean}\""
fi

if [ ! -z "${PT_release+x}" ];
  then params="${params} release=\"${PT_release}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

ansible localhost -m deploy_helper --args "${params}" --one-line | cut -f2- -d">"