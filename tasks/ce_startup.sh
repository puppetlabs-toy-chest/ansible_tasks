#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_slot+x}" ];
  then params="${params} slot=\"${PT_slot}\""
fi

if [ ! -z "${PT_action+x}" ];
  then params="${params} action=\"${PT_action}\""
fi

if [ ! -z "${PT_cfg_file+x}" ];
  then params="${params} cfg_file=\"${PT_cfg_file}\""
fi

if [ ! -z "${PT_patch_file+x}" ];
  then params="${params} patch_file=\"${PT_patch_file}\""
fi

if [ ! -z "${PT_software_file+x}" ];
  then params="${params} software_file=\"${PT_software_file}\""
fi

ansible localhost -m ce_startup --args "${params}" --one-line | cut -f2- -d">"