#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_vrf+x}" ];
  then params="${params} vrf=\"${PT_vrf}\""
fi

if [ ! -z "${PT_vpn_interface+x}" ];
  then params="${params} vpn_interface=\"${PT_vpn_interface}\""
fi

ansible localhost -m ce_vrf_interface --args "${params}" --one-line | cut -f2- -d">"