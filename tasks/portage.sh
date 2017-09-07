#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_nodeps+x}" ];
  then params="${params} nodeps=\"${PT_nodeps}\""
fi

if [ ! -z "${PT_onlydeps+x}" ];
  then params="${params} onlydeps=\"${PT_onlydeps}\""
fi

if [ ! -z "${PT_newuse+x}" ];
  then params="${params} newuse=\"${PT_newuse}\""
fi

if [ ! -z "${PT_oneshot+x}" ];
  then params="${params} oneshot=\"${PT_oneshot}\""
fi

if [ ! -z "${PT_update+x}" ];
  then params="${params} update=\"${PT_update}\""
fi

if [ ! -z "${PT_deep+x}" ];
  then params="${params} deep=\"${PT_deep}\""
fi

if [ ! -z "${PT_sync+x}" ];
  then params="${params} sync=\"${PT_sync}\""
fi

if [ ! -z "${PT_keepgoing+x}" ];
  then params="${params} keepgoing=\"${PT_keepgoing}\""
fi

if [ ! -z "${PT_depclean+x}" ];
  then params="${params} depclean=\"${PT_depclean}\""
fi

if [ ! -z "${PT_jobs+x}" ];
  then params="${params} jobs=\"${PT_jobs}\""
fi

if [ ! -z "${PT_noreplace+x}" ];
  then params="${params} noreplace=\"${PT_noreplace}\""
fi

if [ ! -z "${PT_loadavg+x}" ];
  then params="${params} loadavg=\"${PT_loadavg}\""
fi

if [ ! -z "${PT_verbose+x}" ];
  then params="${params} verbose=\"${PT_verbose}\""
fi

if [ ! -z "${PT_getbinpkg+x}" ];
  then params="${params} getbinpkg=\"${PT_getbinpkg}\""
fi

if [ ! -z "${PT_package+x}" ];
  then params="${params} package=\"${PT_package}\""
fi

if [ ! -z "${PT_quiet+x}" ];
  then params="${params} quiet=\"${PT_quiet}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_changed_use+x}" ];
  then params="${params} changed_use=\"${PT_changed_use}\""
fi

if [ ! -z "${PT_usepkgonly+x}" ];
  then params="${params} usepkgonly=\"${PT_usepkgonly}\""
fi

ansible localhost -m portage --args "${params}" --one-line | cut -f2- -d">"