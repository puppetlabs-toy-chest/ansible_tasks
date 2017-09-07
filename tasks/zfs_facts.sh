#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_parsable+x}" ];
  then params="${params} parsable=\"${PT_parsable}\""
fi

if [ ! -z "${PT_depth+x}" ];
  then params="${params} depth=\"${PT_depth}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_recurse+x}" ];
  then params="${params} recurse=\"${PT_recurse}\""
fi

if [ ! -z "${PT_properties+x}" ];
  then params="${params} properties=\"${PT_properties}\""
fi

ansible localhost -m zfs_facts --args "${params}" --one-line | cut -f2- -d">"