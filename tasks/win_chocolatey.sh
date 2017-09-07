#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_upgrade+x}" ];
  then params="${params} upgrade=\"${PT_upgrade}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_ignore_checksums+x}" ];
  then params="${params} ignore_checksums=\"${PT_ignore_checksums}\""
fi

if [ ! -z "${PT_allow_empty_checksums+x}" ];
  then params="${params} allow_empty_checksums=\"${PT_allow_empty_checksums}\""
fi

if [ ! -z "${PT_install_args+x}" ];
  then params="${params} install_args=\"${PT_install_args}\""
fi

if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_params+x}" ];
  then params="${params} params=\"${PT_params}\""
fi

if [ ! -z "${PT_ignore_dependencies+x}" ];
  then params="${params} ignore_dependencies=\"${PT_ignore_dependencies}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

ansible localhost -m win_chocolatey --args "${params}" --one-line | cut -f2- -d">"