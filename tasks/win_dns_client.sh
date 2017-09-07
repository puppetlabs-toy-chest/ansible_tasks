#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_adapter_names+x}" ];
  then params="${params} adapter_names=\"${PT_adapter_names}\""
fi

if [ ! -z "${PT_ipv4_addresses+x}" ];
  then params="${params} ipv4_addresses=\"${PT_ipv4_addresses}\""
fi

ansible localhost -m win_dns_client --args "${params}" --one-line | cut -f2- -d">"