#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_panorama_primary+x}" ];
  then params="${params} panorama_primary=\"${PT_panorama_primary}\""
fi

if [ ! -z "${PT_dns_server_secondary+x}" ];
  then params="${params} dns_server_secondary=\"${PT_dns_server_secondary}\""
fi

if [ ! -z "${PT_dns_server_primary+x}" ];
  then params="${params} dns_server_primary=\"${PT_dns_server_primary}\""
fi

if [ ! -z "${PT_panorama_secondary+x}" ];
  then params="${params} panorama_secondary=\"${PT_panorama_secondary}\""
fi

if [ ! -z "${PT_commit+x}" ];
  then params="${params} commit=\"${PT_commit}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_ip_address+x}" ];
  then params="${params} ip_address=\"${PT_ip_address}\""
fi

ansible localhost -m panos_mgtconfig --args "${params}" --one-line | cut -f2- -d">"