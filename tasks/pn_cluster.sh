#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_pn_name+x}" ];
  then params="${params} pn_name=\"${PT_pn_name}\""
fi

if [ ! -z "${PT_pn_cluster_node1+x}" ];
  then params="${params} pn_cluster_node1=\"${PT_pn_cluster_node1}\""
fi

if [ ! -z "${PT_pn_clipassword+x}" ];
  then params="${params} pn_clipassword=\"${PT_pn_clipassword}\""
fi

if [ ! -z "${PT_pn_cliusername+x}" ];
  then params="${params} pn_cliusername=\"${PT_pn_cliusername}\""
fi

if [ ! -z "${PT_pn_validate+x}" ];
  then params="${params} pn_validate=\"${PT_pn_validate}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_pn_cliswitch+x}" ];
  then params="${params} pn_cliswitch=\"${PT_pn_cliswitch}\""
fi

if [ ! -z "${PT_pn_cluster_node2+x}" ];
  then params="${params} pn_cluster_node2=\"${PT_pn_cluster_node2}\""
fi

ansible localhost -m pn_cluster --args "${params}" --one-line | cut -f2- -d">"