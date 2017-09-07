#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_addr+x}" ];
  then params="${params} addr=\"${PT_addr}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_mask+x}" ];
  then params="${params} mask=\"${PT_mask}\""
fi

if [ ! -z "${PT_ipv4_type+x}" ];
  then params="${params} ipv4_type=\"${PT_ipv4_type}\""
fi

ansible localhost -m ce_ip_interface --args "${params}" --one-line | cut -f2- -d">"