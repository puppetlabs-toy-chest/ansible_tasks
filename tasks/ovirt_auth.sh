#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_ca_file+x}" ];
  then params="${params} ca_file=\"${PT_ca_file}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_insecure+x}" ];
  then params="${params} insecure=\"${PT_insecure}\""
fi

if [ ! -z "${PT_kerberos+x}" ];
  then params="${params} kerberos=\"${PT_kerberos}\""
fi

if [ ! -z "${PT_compress+x}" ];
  then params="${params} compress=\"${PT_compress}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

ansible localhost -m ovirt_auth --args "${params}" --one-line | cut -f2- -d">"