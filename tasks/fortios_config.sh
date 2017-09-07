#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_config_file+x}" ];
  then params="${params} config_file=\"${PT_config_file}\""
fi

if [ ! -z "${PT_file_mode+x}" ];
  then params="${params} file_mode=\"${PT_file_mode}\""
fi

if [ ! -z "${PT_backup_path+x}" ];
  then params="${params} backup_path=\"${PT_backup_path}\""
fi

if [ ! -z "${PT_filter+x}" ];
  then params="${params} filter=\"${PT_filter}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_backup_filename+x}" ];
  then params="${params} backup_filename=\"${PT_backup_filename}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_backup+x}" ];
  then params="${params} backup=\"${PT_backup}\""
fi

if [ ! -z "${PT_vdom+x}" ];
  then params="${params} vdom=\"${PT_vdom}\""
fi

ansible localhost -m fortios_config --args "${params}" --one-line | cut -f2- -d">"