#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_executable+x}" ];
  then params="${params} executable=\"${PT_executable}\""
fi

if [ ! -z "${PT_chdir+x}" ];
  then params="${params} chdir=\"${PT_chdir}\""
fi

if [ ! -z "${PT_gemfile+x}" ];
  then params="${params} gemfile=\"${PT_gemfile}\""
fi

if [ ! -z "${PT_clean+x}" ];
  then params="${params} clean=\"${PT_clean}\""
fi

if [ ! -z "${PT_user_install+x}" ];
  then params="${params} user_install=\"${PT_user_install}\""
fi

if [ ! -z "${PT_extra_args+x}" ];
  then params="${params} extra_args=\"${PT_extra_args}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_deployment_mode+x}" ];
  then params="${params} deployment_mode=\"${PT_deployment_mode}\""
fi

if [ ! -z "${PT_binstub_directory+x}" ];
  then params="${params} binstub_directory=\"${PT_binstub_directory}\""
fi

if [ ! -z "${PT_exclude_groups+x}" ];
  then params="${params} exclude_groups=\"${PT_exclude_groups}\""
fi

if [ ! -z "${PT_local+x}" ];
  then params="${params} local=\"${PT_local}\""
fi

if [ ! -z "${PT_gem_path+x}" ];
  then params="${params} gem_path=\"${PT_gem_path}\""
fi

ansible localhost -m bundler --args "${params}" --one-line | cut -f2- -d">"