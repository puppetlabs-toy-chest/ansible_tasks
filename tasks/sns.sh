#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_http+x}" ];
  then params="${params} http=\"${PT_http}\""
fi

if [ ! -z "${PT_sqs+x}" ];
  then params="${params} sqs=\"${PT_sqs}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_sms+x}" ];
  then params="${params} sms=\"${PT_sms}\""
fi

if [ ! -z "${PT_topic+x}" ];
  then params="${params} topic=\"${PT_topic}\""
fi

if [ ! -z "${PT_https+x}" ];
  then params="${params} https=\"${PT_https}\""
fi

if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_message_attributes+x}" ];
  then params="${params} message_attributes=\"${PT_message_attributes}\""
fi

if [ ! -z "${PT_email+x}" ];
  then params="${params} email=\"${PT_email}\""
fi

if [ ! -z "${PT_message_structure+x}" ];
  then params="${params} message_structure=\"${PT_message_structure}\""
fi

if [ ! -z "${PT_subject+x}" ];
  then params="${params} subject=\"${PT_subject}\""
fi

ansible localhost -m sns --args "${params}" --one-line | cut -f2- -d">"