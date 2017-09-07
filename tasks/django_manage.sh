#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_virtualenv+x}" ];
  then params="${params} virtualenv=\"${PT_virtualenv}\""
fi

if [ ! -z "${PT_app_path+x}" ];
  then params="${params} app_path=\"${PT_app_path}\""
fi

if [ ! -z "${PT_settings+x}" ];
  then params="${params} settings=\"${PT_settings}\""
fi

if [ ! -z "${PT_pythonpath+x}" ];
  then params="${params} pythonpath=\"${PT_pythonpath}\""
fi

if [ ! -z "${PT_database+x}" ];
  then params="${params} database=\"${PT_database}\""
fi

if [ ! -z "${PT_apps+x}" ];
  then params="${params} apps=\"${PT_apps}\""
fi

if [ ! -z "${PT_cache_table+x}" ];
  then params="${params} cache_table=\"${PT_cache_table}\""
fi

if [ ! -z "${PT_merge+x}" ];
  then params="${params} merge=\"${PT_merge}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_skip+x}" ];
  then params="${params} skip=\"${PT_skip}\""
fi

if [ ! -z "${PT_link+x}" ];
  then params="${params} link=\"${PT_link}\""
fi

if [ ! -z "${PT_fixtures+x}" ];
  then params="${params} fixtures=\"${PT_fixtures}\""
fi

if [ ! -z "${PT_failfast+x}" ];
  then params="${params} failfast=\"${PT_failfast}\""
fi

ansible localhost -m django_manage --args "${params}" --one-line | cut -f2- -d">"