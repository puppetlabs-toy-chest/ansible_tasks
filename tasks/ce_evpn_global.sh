#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_evpn_overlay_enable+x}" ];
  then params="${params} evpn_overlay_enable=\"${PT_evpn_overlay_enable}\""
fi

ansible localhost -m ce_evpn_global --args "${params}" --one-line | cut -f2- -d">"