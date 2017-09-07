#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_flow_eviction_policy+x}" ];
  then params="${params} flow_eviction_policy=\"${PT_flow_eviction_policy}\""
fi

if [ ! -z "${PT_service_policy+x}" ];
  then params="${params} service_policy=\"${PT_service_policy}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_parent+x}" ];
  then params="${params} parent=\"${PT_parent}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
fi

if [ ! -z "${PT_vlans+x}" ];
  then params="${params} vlans=\"${PT_vlans}\""
fi

if [ ! -z "${PT_connection_limit+x}" ];
  then params="${params} connection_limit=\"${PT_connection_limit}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_strict+x}" ];
  then params="${params} strict=\"${PT_strict}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_routing_protocol+x}" ];
  then params="${params} routing_protocol=\"${PT_routing_protocol}\""
fi

if [ ! -z "${PT_server_port+x}" ];
  then params="${params} server_port=\"${PT_server_port}\""
fi

if [ ! -z "${PT_bwc_policy+x}" ];
  then params="${params} bwc_policy=\"${PT_bwc_policy}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m bigip_routedomain --args "${params}" --one-line | cut -f2- -d">"