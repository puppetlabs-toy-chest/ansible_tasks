#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_save_config+x}" ];
  then params="${params} save_config=\"${PT_save_config}\""
fi

if [ ! -z "${PT_confirm+x}" ];
  then params="${params} confirm=\"${PT_confirm}\""
fi

ansible localhost -m ce_reboot --args "${params}" --one-line | cut -f2- -d">"