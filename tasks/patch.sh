#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_strip+x}" ];
  then params="${params} strip=\"${PT_strip}\""
fi

if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_remote_src+x}" ];
  then params="${params} remote_src=\"${PT_remote_src}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_binary+x}" ];
  then params="${params} binary=\"${PT_binary}\""
fi

if [ ! -z "${PT_basedir+x}" ];
  then params="${params} basedir=\"${PT_basedir}\""
fi

if [ ! -z "${PT_backup+x}" ];
  then params="${params} backup=\"${PT_backup}\""
fi

ansible localhost -m patch --args "${params}" --one-line | cut -f2- -d">"