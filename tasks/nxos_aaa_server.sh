#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_directed_request+x}" ];
  then params="${params} directed_request=\"${PT_directed_request}\""
fi

if [ ! -z "${PT_server_type+x}" ];
  then params="${params} server_type=\"${PT_server_type}\""
fi

if [ ! -z "${PT_encrypt_type+x}" ];
  then params="${params} encrypt_type=\"${PT_encrypt_type}\""
fi

if [ ! -z "${PT_global_key+x}" ];
  then params="${params} global_key=\"${PT_global_key}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_server_timeout+x}" ];
  then params="${params} server_timeout=\"${PT_server_timeout}\""
fi

if [ ! -z "${PT_deadtime+x}" ];
  then params="${params} deadtime=\"${PT_deadtime}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
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

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

ansible localhost -m nxos_aaa_server --args "${params}" --one-line | cut -f2- -d">"