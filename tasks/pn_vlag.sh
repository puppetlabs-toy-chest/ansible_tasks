#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_pn_name+x}" ];
  then params="${params} pn_name=\"${PT_pn_name}\""
fi

if [ ! -z "${PT_pn_lacp_fallback+x}" ];
  then params="${params} pn_lacp_fallback=\"${PT_pn_lacp_fallback}\""
fi

if [ ! -z "${PT_pn_lacp_fallback_timeout+x}" ];
  then params="${params} pn_lacp_fallback_timeout=\"${PT_pn_lacp_fallback_timeout}\""
fi

if [ ! -z "${PT_pn_clipassword+x}" ];
  then params="${params} pn_clipassword=\"${PT_pn_clipassword}\""
fi

if [ ! -z "${PT_pn_lacp_timeout+x}" ];
  then params="${params} pn_lacp_timeout=\"${PT_pn_lacp_timeout}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_pn_cliusername+x}" ];
  then params="${params} pn_cliusername=\"${PT_pn_cliusername}\""
fi

if [ ! -z "${PT_pn_lacp_mode+x}" ];
  then params="${params} pn_lacp_mode=\"${PT_pn_lacp_mode}\""
fi

if [ ! -z "${PT_pn_failover_action+x}" ];
  then params="${params} pn_failover_action=\"${PT_pn_failover_action}\""
fi

if [ ! -z "${PT_pn_peer_port+x}" ];
  then params="${params} pn_peer_port=\"${PT_pn_peer_port}\""
fi

if [ ! -z "${PT_pn_peer_switch+x}" ];
  then params="${params} pn_peer_switch=\"${PT_pn_peer_switch}\""
fi

if [ ! -z "${PT_pn_port+x}" ];
  then params="${params} pn_port=\"${PT_pn_port}\""
fi

if [ ! -z "${PT_pn_cliswitch+x}" ];
  then params="${params} pn_cliswitch=\"${PT_pn_cliswitch}\""
fi

if [ ! -z "${PT_pn_mode+x}" ];
  then params="${params} pn_mode=\"${PT_pn_mode}\""
fi

ansible localhost -m pn_vlag --args "${params}" --one-line | cut -f2- -d">"