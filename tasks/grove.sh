#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_service+x}" ];
  then params="${params} service=\"${PT_service}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_icon_url+x}" ];
  then params="${params} icon_url=\"${PT_icon_url}\""
fi

if [ ! -z "${PT_message+x}" ];
  then params="${params} message=\"${PT_message}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_channel_token+x}" ];
  then params="${params} channel_token=\"${PT_channel_token}\""
fi

ansible localhost -m grove --args "${params}" --one-line | cut -f2- -d">"