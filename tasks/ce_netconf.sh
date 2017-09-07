#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_rpc+x}" ];
  then params="${params} rpc=\"${PT_rpc}\""
fi

if [ ! -z "${PT_cfg_xml+x}" ];
  then params="${params} cfg_xml=\"${PT_cfg_xml}\""
fi

ansible localhost -m ce_netconf --args "${params}" --one-line | cut -f2- -d">"