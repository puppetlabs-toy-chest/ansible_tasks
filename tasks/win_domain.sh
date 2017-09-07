#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_dns_domain_name+x}" ];
  then params="${params} dns_domain_name=\"${PT_dns_domain_name}\""
fi

if [ ! -z "${PT_safe_mode_password+x}" ];
  then params="${params} safe_mode_password=\"${PT_safe_mode_password}\""
fi

ansible localhost -m win_domain --args "${params}" --one-line | cut -f2- -d">"