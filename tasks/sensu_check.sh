#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_interval+x}" ];
  then params="${params} interval=\"${PT_interval}\""
fi

if [ ! -z "${PT_handle+x}" ];
  then params="${params} handle=\"${PT_handle}\""
fi

if [ ! -z "${PT_subscribers+x}" ];
  then params="${params} subscribers=\"${PT_subscribers}\""
fi

if [ ! -z "${PT_metric+x}" ];
  then params="${params} metric=\"${PT_metric}\""
fi

if [ ! -z "${PT_subdue_begin+x}" ];
  then params="${params} subdue_begin=\"${PT_subdue_begin}\""
fi

if [ ! -z "${PT_dependencies+x}" ];
  then params="${params} dependencies=\"${PT_dependencies}\""
fi

if [ ! -z "${PT_occurrences+x}" ];
  then params="${params} occurrences=\"${PT_occurrences}\""
fi

if [ ! -z "${PT_low_flap_threshold+x}" ];
  then params="${params} low_flap_threshold=\"${PT_low_flap_threshold}\""
fi

if [ ! -z "${PT_aggregate+x}" ];
  then params="${params} aggregate=\"${PT_aggregate}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_standalone+x}" ];
  then params="${params} standalone=\"${PT_standalone}\""
fi

if [ ! -z "${PT_backup+x}" ];
  then params="${params} backup=\"${PT_backup}\""
fi

if [ ! -z "${PT_handlers+x}" ];
  then params="${params} handlers=\"${PT_handlers}\""
fi

if [ ! -z "${PT_publish+x}" ];
  then params="${params} publish=\"${PT_publish}\""
fi

if [ ! -z "${PT_custom+x}" ];
  then params="${params} custom=\"${PT_custom}\""
fi

if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_high_flap_threshold+x}" ];
  then params="${params} high_flap_threshold=\"${PT_high_flap_threshold}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_subdue_end+x}" ];
  then params="${params} subdue_end=\"${PT_subdue_end}\""
fi

if [ ! -z "${PT_refresh+x}" ];
  then params="${params} refresh=\"${PT_refresh}\""
fi

ansible localhost -m sensu_check --args "${params}" --one-line | cut -f2- -d">"