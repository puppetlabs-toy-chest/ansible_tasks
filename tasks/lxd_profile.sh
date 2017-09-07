#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_new_name+x}" ];
  then params="${params} new_name=\"${PT_new_name}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
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

if [ ! -z "${PT_devices+x}" ];
  then params="${params} devices=\"${PT_devices}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_key_file+x}" ];
  then params="${params} key_file=\"${PT_key_file}\""
fi

if [ ! -z "${PT_trust_password+x}" ];
  then params="${params} trust_password=\"${PT_trust_password}\""
fi

ansible localhost -m lxd_profile --args "${params}" --one-line | cut -f2- -d">"