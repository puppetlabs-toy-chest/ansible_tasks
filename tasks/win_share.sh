#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_deny+x}" ];
  then params="${params} deny=\"${PT_deny}\""
fi

if [ ! -z "${PT_full+x}" ];
  then params="${params} full=\"${PT_full}\""
fi

if [ ! -z "${PT_encrypt+x}" ];
  then params="${params} encrypt=\"${PT_encrypt}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_read+x}" ];
  then params="${params} read=\"${PT_read}\""
fi

if [ ! -z "${PT_list+x}" ];
  then params="${params} list=\"${PT_list}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_caching_mode+x}" ];
  then params="${params} caching_mode=\"${PT_caching_mode}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_change+x}" ];
  then params="${params} change=\"${PT_change}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

ansible localhost -m win_share --args "${params}" --one-line | cut -f2- -d">"