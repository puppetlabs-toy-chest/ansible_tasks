#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_retry+x}" ];
  then params="${params} retry=\"${PT_retry}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_interfaces+x}" ];
  then params="${params} interfaces=\"${PT_interfaces}\""
fi

if [ ! -z "${PT_refresh+x}" ];
  then params="${params} refresh=\"${PT_refresh}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_contact+x}" ];
  then params="${params} contact=\"${PT_contact}\""
fi

if [ ! -z "${PT_expire+x}" ];
  then params="${params} expire=\"${PT_expire}\""
fi

if [ ! -z "${PT_ttl+x}" ];
  then params="${params} ttl=\"${PT_ttl}\""
fi

if [ ! -z "${PT_nameserver+x}" ];
  then params="${params} nameserver=\"${PT_nameserver}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_mx+x}" ];
  then params="${params} mx=\"${PT_mx}\""
fi

ansible localhost -m udm_dns_zone --args "${params}" --one-line | cut -f2- -d">"