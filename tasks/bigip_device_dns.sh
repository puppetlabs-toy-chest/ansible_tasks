#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_search+x}" ];
  then params="${params} search=\"${PT_search}\""
fi

if [ ! -z "${PT_cache+x}" ];
  then params="${params} cache=\"${PT_cache}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_ip_version+x}" ];
  then params="${params} ip_version=\"${PT_ip_version}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_server_port+x}" ];
  then params="${params} server_port=\"${PT_server_port}\""
fi

if [ ! -z "${PT_forwarders+x}" ];
  then params="${params} forwarders=\"${PT_forwarders}\""
fi

if [ ! -z "${PT_name_servers+x}" ];
  then params="${params} name_servers=\"${PT_name_servers}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m bigip_device_dns --args "${params}" --one-line | cut -f2- -d">"