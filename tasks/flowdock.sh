#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_from_name+x}" ];
  then params="${params} from_name=\"${PT_from_name}\""
fi

if [ ! -z "${PT_from_address+x}" ];
  then params="${params} from_address=\"${PT_from_address}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_external_user_name+x}" ];
  then params="${params} external_user_name=\"${PT_external_user_name}\""
fi

if [ ! -z "${PT_project+x}" ];
  then params="${params} project=\"${PT_project}\""
fi

if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_link+x}" ];
  then params="${params} link=\"${PT_link}\""
fi

if [ ! -z "${PT_reply_to+x}" ];
  then params="${params} reply_to=\"${PT_reply_to}\""
fi

if [ ! -z "${PT_subject+x}" ];
  then params="${params} subject=\"${PT_subject}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

ansible localhost -m flowdock --args "${params}" --one-line | cut -f2- -d">"