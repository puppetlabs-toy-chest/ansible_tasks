#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_dpkg_options+x}" ];
  then params="${params} dpkg_options=\"${PT_dpkg_options}\""
fi

if [ ! -z "${PT_upgrade+x}" ];
  then params="${params} upgrade=\"${PT_upgrade}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_autoclean+x}" ];
  then params="${params} autoclean=\"${PT_autoclean}\""
fi

if [ ! -z "${PT_purge+x}" ];
  then params="${params} purge=\"${PT_purge}\""
fi

if [ ! -z "${PT_allow_unauthenticated+x}" ];
  then params="${params} allow_unauthenticated=\"${PT_allow_unauthenticated}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_autoremove+x}" ];
  then params="${params} autoremove=\"${PT_autoremove}\""
fi

if [ ! -z "${PT_update_cache+x}" ];
  then params="${params} update_cache=\"${PT_update_cache}\""
fi

if [ ! -z "${PT_default_release+x}" ];
  then params="${params} default_release=\"${PT_default_release}\""
fi

if [ ! -z "${PT_only_upgrade+x}" ];
  then params="${params} only_upgrade=\"${PT_only_upgrade}\""
fi

if [ ! -z "${PT_cache_valid_time+x}" ];
  then params="${params} cache_valid_time=\"${PT_cache_valid_time}\""
fi

if [ ! -z "${PT_deb+x}" ];
  then params="${params} deb=\"${PT_deb}\""
fi

if [ ! -z "${PT_install_recommends+x}" ];
  then params="${params} install_recommends=\"${PT_install_recommends}\""
fi

ansible localhost -m apt --args "${params}" --one-line | cut -f2- -d">"