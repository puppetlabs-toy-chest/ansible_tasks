#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_update_password+x}" ];
  then params="${params} update_password=\"${PT_update_password}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_collection+x}" ];
  then params="${params} collection=\"${PT_collection}\""
fi

if [ ! -z "${PT_purge+x}" ];
  then params="${params} purge=\"${PT_purge}\""
fi

if [ ! -z "${PT_privilege+x}" ];
  then params="${params} privilege=\"${PT_privilege}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_role+x}" ];
  then params="${params} role=\"${PT_role}\""
fi

if [ ! -z "${PT_nopassword+x}" ];
  then params="${params} nopassword=\"${PT_nopassword}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_sshkey+x}" ];
  then params="${params} sshkey=\"${PT_sshkey}\""
fi

ansible localhost -m net_user --args "${params}" --one-line | cut -f2- -d">"