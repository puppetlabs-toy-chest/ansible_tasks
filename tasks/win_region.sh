#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_unicode_language+x}" ];
  then params="${params} unicode_language=\"${PT_unicode_language}\""
fi

if [ ! -z "${PT_copy_settings+x}" ];
  then params="${params} copy_settings=\"${PT_copy_settings}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_format+x}" ];
  then params="${params} format=\"${PT_format}\""
fi

ansible localhost -m win_region --args "${params}" --one-line | cut -f2- -d">"