#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_track_submodules+x}" ];
  then params="${params} track_submodules=\"${PT_track_submodules}\""
fi

if [ ! -z "${PT_reference+x}" ];
  then params="${params} reference=\"${PT_reference}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_accept_hostkey+x}" ];
  then params="${params} accept_hostkey=\"${PT_accept_hostkey}\""
fi

if [ ! -z "${PT_clone+x}" ];
  then params="${params} clone=\"${PT_clone}\""
fi

if [ ! -z "${PT_update+x}" ];
  then params="${params} update=\"${PT_update}\""
fi

if [ ! -z "${PT_ssh_opts+x}" ];
  then params="${params} ssh_opts=\"${PT_ssh_opts}\""
fi

if [ ! -z "${PT_repo+x}" ];
  then params="${params} repo=\"${PT_repo}\""
fi

if [ ! -z "${PT_bare+x}" ];
  then params="${params} bare=\"${PT_bare}\""
fi

if [ ! -z "${PT_verify_commit+x}" ];
  then params="${params} verify_commit=\"${PT_verify_commit}\""
fi

if [ ! -z "${PT_archive+x}" ];
  then params="${params} archive=\"${PT_archive}\""
fi

if [ ! -z "${PT_recursive+x}" ];
  then params="${params} recursive=\"${PT_recursive}\""
fi

if [ ! -z "${PT_executable+x}" ];
  then params="${params} executable=\"${PT_executable}\""
fi

if [ ! -z "${PT_remote+x}" ];
  then params="${params} remote=\"${PT_remote}\""
fi

if [ ! -z "${PT_refspec+x}" ];
  then params="${params} refspec=\"${PT_refspec}\""
fi

if [ ! -z "${PT_umask+x}" ];
  then params="${params} umask=\"${PT_umask}\""
fi

if [ ! -z "${PT_depth+x}" ];
  then params="${params} depth=\"${PT_depth}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_key_file+x}" ];
  then params="${params} key_file=\"${PT_key_file}\""
fi

ansible localhost -m git --args "${params}" --one-line | cut -f2- -d">"