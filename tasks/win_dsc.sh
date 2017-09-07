#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_module_version+x}" ];
  then params="${params} module_version=\"${PT_module_version}\""
fi

if [ ! -z "${PT_resource_name+x}" ];
  then params="${params} resource_name=\"${PT_resource_name}\""
fi

ansible localhost -m win_dsc --args "${params}" --one-line | cut -f2- -d">"