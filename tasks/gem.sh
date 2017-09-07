#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_include_dependencies+x}" ];
  then params="${params} include_dependencies=\"${PT_include_dependencies}\""
fi

if [ ! -z "${PT_executable+x}" ];
  then params="${params} executable=\"${PT_executable}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_repository+x}" ];
  then params="${params} repository=\"${PT_repository}\""
fi

if [ ! -z "${PT_build_flags+x}" ];
  then params="${params} build_flags=\"${PT_build_flags}\""
fi

if [ ! -z "${PT_include_doc+x}" ];
  then params="${params} include_doc=\"${PT_include_doc}\""
fi

if [ ! -z "${PT_user_install+x}" ];
  then params="${params} user_install=\"${PT_user_install}\""
fi

if [ ! -z "${PT_pre_release+x}" ];
  then params="${params} pre_release=\"${PT_pre_release}\""
fi

if [ ! -z "${PT_env_shebang+x}" ];
  then params="${params} env_shebang=\"${PT_env_shebang}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_gem_source+x}" ];
  then params="${params} gem_source=\"${PT_gem_source}\""
fi

ansible localhost -m gem --args "${params}" --one-line | cut -f2- -d">"