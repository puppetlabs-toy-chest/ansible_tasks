#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_passive_interface+x}" ];
  then params="${params} passive_interface=\"${PT_passive_interface}\""
fi

if [ ! -z "${PT_message_digest_password+x}" ];
  then params="${params} message_digest_password=\"${PT_message_digest_password}\""
fi

if [ ! -z "${PT_message_digest_encryption_type+x}" ];
  then params="${params} message_digest_encryption_type=\"${PT_message_digest_encryption_type}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_dead_interval+x}" ];
  then params="${params} dead_interval=\"${PT_dead_interval}\""
fi

if [ ! -z "${PT_hello_interval+x}" ];
  then params="${params} hello_interval=\"${PT_hello_interval}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_area+x}" ];
  then params="${params} area=\"${PT_area}\""
fi

if [ ! -z "${PT_message_digest_algorithm_type+x}" ];
  then params="${params} message_digest_algorithm_type=\"${PT_message_digest_algorithm_type}\""
fi

if [ ! -z "${PT_message_digest_key_id+x}" ];
  then params="${params} message_digest_key_id=\"${PT_message_digest_key_id}\""
fi

if [ ! -z "${PT_ospf+x}" ];
  then params="${params} ospf=\"${PT_ospf}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_cost+x}" ];
  then params="${params} cost=\"${PT_cost}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_message_digest+x}" ];
  then params="${params} message_digest=\"${PT_message_digest}\""
fi

ansible localhost -m nxos_interface_ospf --args "${params}" --one-line | cut -f2- -d">"