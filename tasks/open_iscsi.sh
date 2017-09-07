#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_auto_node_startup+x}" ];
  then params="${params} auto_node_startup=\"${PT_auto_node_startup}\""
fi

if [ ! -z "${PT_target+x}" ];
  then params="${params} target=\"${PT_target}\""
fi

if [ ! -z "${PT_show_nodes+x}" ];
  then params="${params} show_nodes=\"${PT_show_nodes}\""
fi

if [ ! -z "${PT_node_auth+x}" ];
  then params="${params} node_auth=\"${PT_node_auth}\""
fi

if [ ! -z "${PT_node_pass+x}" ];
  then params="${params} node_pass=\"${PT_node_pass}\""
fi

if [ ! -z "${PT_discover+x}" ];
  then params="${params} discover=\"${PT_discover}\""
fi

if [ ! -z "${PT_portal+x}" ];
  then params="${params} portal=\"${PT_portal}\""
fi

if [ ! -z "${PT_login+x}" ];
  then params="${params} login=\"${PT_login}\""
fi

if [ ! -z "${PT_node_user+x}" ];
  then params="${params} node_user=\"${PT_node_user}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

ansible localhost -m open_iscsi --args "${params}" --one-line | cut -f2- -d">"