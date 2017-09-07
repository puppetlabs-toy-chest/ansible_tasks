#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_value_type+x}" ];
  then params="${params} value_type=\"${PT_value_type}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_direct+x}" ];
  then params="${params} direct=\"${PT_direct}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

if [ ! -z "${PT_config_source+x}" ];
  then params="${params} config_source=\"${PT_config_source}\""
fi

ansible localhost -m gconftool2 --args "${params}" --one-line | cut -f2- -d">"