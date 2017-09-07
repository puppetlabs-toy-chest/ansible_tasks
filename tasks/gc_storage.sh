#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_permission+x}" ];
  then params="${params} permission=\"${PT_permission}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_gs_access_key+x}" ];
  then params="${params} gs_access_key=\"${PT_gs_access_key}\""
fi

if [ ! -z "${PT_object+x}" ];
  then params="${params} object=\"${PT_object}\""
fi

if [ ! -z "${PT_bucket+x}" ];
  then params="${params} bucket=\"${PT_bucket}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_gs_secret_key+x}" ];
  then params="${params} gs_secret_key=\"${PT_gs_secret_key}\""
fi

if [ ! -z "${PT_expiration+x}" ];
  then params="${params} expiration=\"${PT_expiration}\""
fi

if [ ! -z "${PT_headers+x}" ];
  then params="${params} headers=\"${PT_headers}\""
fi

ansible localhost -m gc_storage --args "${params}" --one-line | cut -f2- -d">"