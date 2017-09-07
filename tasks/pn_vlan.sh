#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_pn_scope+x}" ];
  then params="${params} pn_scope=\"${PT_pn_scope}\""
fi

if [ ! -z "${PT_pn_clipassword+x}" ];
  then params="${params} pn_clipassword=\"${PT_pn_clipassword}\""
fi

if [ ! -z "${PT_pn_cliusername+x}" ];
  then params="${params} pn_cliusername=\"${PT_pn_cliusername}\""
fi

if [ ! -z "${PT_pn_vlanid+x}" ];
  then params="${params} pn_vlanid=\"${PT_pn_vlanid}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_pn_ports+x}" ];
  then params="${params} pn_ports=\"${PT_pn_ports}\""
fi

if [ ! -z "${PT_pn_untagged_ports+x}" ];
  then params="${params} pn_untagged_ports=\"${PT_pn_untagged_ports}\""
fi

if [ ! -z "${PT_pn_cliswitch+x}" ];
  then params="${params} pn_cliswitch=\"${PT_pn_cliswitch}\""
fi

if [ ! -z "${PT_pn_stats+x}" ];
  then params="${params} pn_stats=\"${PT_pn_stats}\""
fi

if [ ! -z "${PT_pn_description+x}" ];
  then params="${params} pn_description=\"${PT_pn_description}\""
fi

ansible localhost -m pn_vlan --args "${params}" --one-line | cut -f2- -d">"