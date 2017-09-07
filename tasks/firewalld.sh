#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_service+x}" ];
  then params="${params} service=\"${PT_service}\""
fi

if [ ! -z "${PT_masquerade+x}" ];
  then params="${params} masquerade=\"${PT_masquerade}\""
fi

if [ ! -z "${PT_immediate+x}" ];
  then params="${params} immediate=\"${PT_immediate}\""
fi

if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_permanent+x}" ];
  then params="${params} permanent=\"${PT_permanent}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_rich_rule+x}" ];
  then params="${params} rich_rule=\"${PT_rich_rule}\""
fi

ansible localhost -m firewalld --args "${params}" --one-line | cut -f2- -d">"