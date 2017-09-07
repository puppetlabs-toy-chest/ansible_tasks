#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_from+x}" ];
  then params="${params} from=\"${PT_from}\""
fi

if [ ! -z "${PT_room+x}" ];
  then params="${params} room=\"${PT_room}\""
fi

if [ ! -z "${PT_color+x}" ];
  then params="${params} color=\"${PT_color}\""
fi

if [ ! -z "${PT_msg_format+x}" ];
  then params="${params} msg_format=\"${PT_msg_format}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_api+x}" ];
  then params="${params} api=\"${PT_api}\""
fi

if [ ! -z "${PT_notify+x}" ];
  then params="${params} notify=\"${PT_notify}\""
fi

if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m hipchat --args "${params}" --one-line | cut -f2- -d">"