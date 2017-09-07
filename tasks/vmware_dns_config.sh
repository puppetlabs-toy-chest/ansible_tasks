#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_domainname+x}" ];
  then params="${params} domainname=\"${PT_domainname}\""
fi

if [ ! -z "${PT_dns_servers+x}" ];
  then params="${params} dns_servers=\"${PT_dns_servers}\""
fi

if [ ! -z "${PT_change_hostname_to+x}" ];
  then params="${params} change_hostname_to=\"${PT_change_hostname_to}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m vmware_dns_config --args "${params}" --one-line | cut -f2- -d">"