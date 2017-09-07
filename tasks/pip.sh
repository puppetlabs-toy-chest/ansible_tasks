#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_virtualenv+x}" ];
  then params="${params} virtualenv=\"${PT_virtualenv}\""
fi

if [ ! -z "${PT_virtualenv_site_packages+x}" ];
  then params="${params} virtualenv_site_packages=\"${PT_virtualenv_site_packages}\""
fi

if [ ! -z "${PT_virtualenv_command+x}" ];
  then params="${params} virtualenv_command=\"${PT_virtualenv_command}\""
fi

if [ ! -z "${PT_chdir+x}" ];
  then params="${params} chdir=\"${PT_chdir}\""
fi

if [ ! -z "${PT_requirements+x}" ];
  then params="${params} requirements=\"${PT_requirements}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_virtualenv_python+x}" ];
  then params="${params} virtualenv_python=\"${PT_virtualenv_python}\""
fi

if [ ! -z "${PT_editable+x}" ];
  then params="${params} editable=\"${PT_editable}\""
fi

if [ ! -z "${PT_umask+x}" ];
  then params="${params} umask=\"${PT_umask}\""
fi

if [ ! -z "${PT_executable+x}" ];
  then params="${params} executable=\"${PT_executable}\""
fi

if [ ! -z "${PT_extra_args+x}" ];
  then params="${params} extra_args=\"${PT_extra_args}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

ansible localhost -m pip --args "${params}" --one-line | cut -f2- -d">"