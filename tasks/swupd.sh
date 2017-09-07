#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_contenturl+x}" ];
  then params="${params} contenturl=\"${PT_contenturl}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_format+x}" ];
  then params="${params} format=\"${PT_format}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_verify+x}" ];
  then params="${params} verify=\"${PT_verify}\""
fi

if [ ! -z "${PT_update+x}" ];
  then params="${params} update=\"${PT_update}\""
fi

if [ ! -z "${PT_manifest+x}" ];
  then params="${params} manifest=\"${PT_manifest}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_versionurl+x}" ];
  then params="${params} versionurl=\"${PT_versionurl}\""
fi

ansible localhost -m swupd --args "${params}" --one-line | cut -f2- -d">"