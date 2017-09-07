#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_from_name+x}" ];
  then params="${params} from_name=\"${PT_from_name}\""
fi

if [ ! -z "${PT_from_address+x}" ];
  then params="${params} from_address=\"${PT_from_address}\""
fi

if [ ! -z "${PT_cc+x}" ];
  then params="${params} cc=\"${PT_cc}\""
fi

if [ ! -z "${PT_subject+x}" ];
  then params="${params} subject=\"${PT_subject}\""
fi

if [ ! -z "${PT_bcc+x}" ];
  then params="${params} bcc=\"${PT_bcc}\""
fi

if [ ! -z "${PT_headers+x}" ];
  then params="${params} headers=\"${PT_headers}\""
fi

if [ ! -z "${PT_to_addresses+x}" ];
  then params="${params} to_addresses=\"${PT_to_addresses}\""
fi

if [ ! -z "${PT_html_body+x}" ];
  then params="${params} html_body=\"${PT_html_body}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_attachments+x}" ];
  then params="${params} attachments=\"${PT_attachments}\""
fi

ansible localhost -m sendgrid --args "${params}" --one-line | cut -f2- -d">"