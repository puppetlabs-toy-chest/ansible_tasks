#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_log_level+x}" ];
  then params="${params} log_level=\"${PT_log_level}\""
fi

if [ ! -z "${PT_allow+x}" ];
  then params="${params} allow=\"${PT_allow}\""
fi

if [ ! -z "${PT_banner_text+x}" ];
  then params="${params} banner_text=\"${PT_banner_text}\""
fi

if [ ! -z "${PT_banner+x}" ];
  then params="${params} banner=\"${PT_banner}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_server_port+x}" ];
  then params="${params} server_port=\"${PT_server_port}\""
fi

if [ ! -z "${PT_inactivity_timeout+x}" ];
  then params="${params} inactivity_timeout=\"${PT_inactivity_timeout}\""
fi

if [ ! -z "${PT_login+x}" ];
  then params="${params} login=\"${PT_login}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

ansible localhost -m bigip_device_sshd --args "${params}" --one-line | cut -f2- -d">"