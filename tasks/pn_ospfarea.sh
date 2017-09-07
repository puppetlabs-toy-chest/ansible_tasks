#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_pn_ospf_area+x}" ];
  then params="${params} pn_ospf_area=\"${PT_pn_ospf_area}\""
fi

if [ ! -z "${PT_pn_clipassword+x}" ];
  then params="${params} pn_clipassword=\"${PT_pn_clipassword}\""
fi

if [ ! -z "${PT_pn_vrouter_name+x}" ];
  then params="${params} pn_vrouter_name=\"${PT_pn_vrouter_name}\""
fi

if [ ! -z "${PT_pn_cliusername+x}" ];
  then params="${params} pn_cliusername=\"${PT_pn_cliusername}\""
fi

if [ ! -z "${PT_pn_prefix_listin+x}" ];
  then params="${params} pn_prefix_listin=\"${PT_pn_prefix_listin}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_pn_prefix_listout+x}" ];
  then params="${params} pn_prefix_listout=\"${PT_pn_prefix_listout}\""
fi

if [ ! -z "${PT_pn_stub_type+x}" ];
  then params="${params} pn_stub_type=\"${PT_pn_stub_type}\""
fi

if [ ! -z "${PT_pn_cliswitch+x}" ];
  then params="${params} pn_cliswitch=\"${PT_pn_cliswitch}\""
fi

if [ ! -z "${PT_pn_quiet+x}" ];
  then params="${params} pn_quiet=\"${PT_pn_quiet}\""
fi

ansible localhost -m pn_ospfarea --args "${params}" --one-line | cut -f2- -d">"