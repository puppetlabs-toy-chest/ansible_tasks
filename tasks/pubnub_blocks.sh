#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_account+x}" ];
  then params="${params} account=\"${PT_account}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_keyset+x}" ];
  then params="${params} keyset=\"${PT_keyset}\""
fi

if [ ! -z "${PT_changes+x}" ];
  then params="${params} changes=\"${PT_changes}\""
fi

if [ ! -z "${PT_cache+x}" ];
  then params="${params} cache=\"${PT_cache}\""
fi

if [ ! -z "${PT_application+x}" ];
  then params="${params} application=\"${PT_application}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_email+x}" ];
  then params="${params} email=\"${PT_email}\""
fi

if [ ! -z "${PT_event_handlers+x}" ];
  then params="${params} event_handlers=\"${PT_event_handlers}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

ansible localhost -m pubnub_blocks --args "${params}" --one-line | cut -f2- -d">"