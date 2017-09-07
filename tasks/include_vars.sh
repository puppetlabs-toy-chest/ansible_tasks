#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_ignore_files+x}" ];
  then params="${params} ignore_files=\"${PT_ignore_files}\""
fi

if [ ! -z "${PT_free-form+x}" ];
  then params="${params} free-form=\"${PT_free-form}\""
fi

if [ ! -z "${PT_files_matching+x}" ];
  then params="${params} files_matching=\"${PT_files_matching}\""
fi

if [ ! -z "${PT_depth+x}" ];
  then params="${params} depth=\"${PT_depth}\""
fi

if [ ! -z "${PT_extensions+x}" ];
  then params="${params} extensions=\"${PT_extensions}\""
fi

if [ ! -z "${PT_file+x}" ];
  then params="${params} file=\"${PT_file}\""
fi

if [ ! -z "${PT_dir+x}" ];
  then params="${params} dir=\"${PT_dir}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

ansible localhost -m include_vars --args "${params}" --one-line | cut -f2- -d">"