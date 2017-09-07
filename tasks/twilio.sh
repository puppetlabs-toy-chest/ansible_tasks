#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_from_number+x}" ];
  then params="${params} from_number=\"${PT_from_number}\""
fi

if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_auth_token+x}" ];
  then params="${params} auth_token=\"${PT_auth_token}\""
fi

if [ ! -z "${PT_media_url+x}" ];
  then params="${params} media_url=\"${PT_media_url}\""
fi

if [ ! -z "${PT_to_number+x}" ];
  then params="${params} to_number=\"${PT_to_number}\""
fi

if [ ! -z "${PT_account_sid+x}" ];
  then params="${params} account_sid=\"${PT_account_sid}\""
fi

ansible localhost -m twilio --args "${params}" --one-line | cut -f2- -d">"