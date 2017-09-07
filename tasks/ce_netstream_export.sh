#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_bgp_nexthop+x}" ];
  then params="${params} bgp_nexthop=\"${PT_bgp_nexthop}\""
fi

if [ ! -z "${PT_host_port+x}" ];
  then params="${params} host_port=\"${PT_host_port}\""
fi

if [ ! -z "${PT_source_ip+x}" ];
  then params="${params} source_ip=\"${PT_source_ip}\""
fi

if [ ! -z "${PT_host_ip+x}" ];
  then params="${params} host_ip=\"${PT_host_ip}\""
fi

if [ ! -z "${PT_as_option+x}" ];
  then params="${params} as_option=\"${PT_as_option}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_host_vpn+x}" ];
  then params="${params} host_vpn=\"${PT_host_vpn}\""
fi

ansible localhost -m ce_netstream_export --args "${params}" --one-line | cut -f2- -d">"