#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_executable+x}" ];
  then params="${params} executable=\"${PT_executable}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_installdeps+x}" ];
  then params="${params} installdeps=\"${PT_installdeps}\""
fi

if [ ! -z "${PT_system_lib+x}" ];
  then params="${params} system_lib=\"${PT_system_lib}\""
fi

if [ ! -z "${PT_mirror_only+x}" ];
  then params="${params} mirror_only=\"${PT_mirror_only}\""
fi

if [ ! -z "${PT_from_path+x}" ];
  then params="${params} from_path=\"${PT_from_path}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_mirror+x}" ];
  then params="${params} mirror=\"${PT_mirror}\""
fi

if [ ! -z "${PT_locallib+x}" ];
  then params="${params} locallib=\"${PT_locallib}\""
fi

if [ ! -z "${PT_notest+x}" ];
  then params="${params} notest=\"${PT_notest}\""
fi

ansible localhost -m cpanm --args "${params}" --one-line | cut -f2- -d">"