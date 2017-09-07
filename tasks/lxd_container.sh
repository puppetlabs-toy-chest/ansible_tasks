#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_config+x}" ];
  then params="${params} config=\"${PT_config}\""
fi

if [ ! -z "${PT_cert_file+x}" ];
  then params="${params} cert_file=\"${PT_cert_file}\""
fi

if [ ! -z "${PT_ephemeral+x}" ];
  then params="${params} ephemeral=\"${PT_ephemeral}\""
fi

if [ ! -z "${PT_devices+x}" ];
  then params="${params} devices=\"${PT_devices}\""
fi

if [ ! -z "${PT_wait_for_ipv4_addresses+x}" ];
  then params="${params} wait_for_ipv4_addresses=\"${PT_wait_for_ipv4_addresses}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_architecture+x}" ];
  then params="${params} architecture=\"${PT_architecture}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_key_file+x}" ];
  then params="${params} key_file=\"${PT_key_file}\""
fi

if [ ! -z "${PT_trust_password+x}" ];
  then params="${params} trust_password=\"${PT_trust_password}\""
fi

if [ ! -z "${PT_force_stop+x}" ];
  then params="${params} force_stop=\"${PT_force_stop}\""
fi

ansible localhost -m lxd_container --args "${params}" --one-line | cut -f2- -d">"