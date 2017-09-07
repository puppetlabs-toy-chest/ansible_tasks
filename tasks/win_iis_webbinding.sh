#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_certificate_hash+x}" ];
  then params="${params} certificate_hash=\"${PT_certificate_hash}\""
fi

if [ ! -z "${PT_ip+x}" ];
  then params="${params} ip=\"${PT_ip}\""
fi

if [ ! -z "${PT_host_header+x}" ];
  then params="${params} host_header=\"${PT_host_header}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_certificate_store_name+x}" ];
  then params="${params} certificate_store_name=\"${PT_certificate_store_name}\""
fi

ansible localhost -m win_iis_webbinding --args "${params}" --one-line | cut -f2- -d">"