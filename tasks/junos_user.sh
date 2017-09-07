#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_sshkey+x}" ];
  then params="${params} sshkey=\"${PT_sshkey}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_purge+x}" ];
  then params="${params} purge=\"${PT_purge}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_role+x}" ];
  then params="${params} role=\"${PT_role}\""
fi

if [ ! -z "${PT_full_name+x}" ];
  then params="${params} full_name=\"${PT_full_name}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_users+x}" ];
  then params="${params} users=\"${PT_users}\""
fi

ansible localhost -m junos_user --args "${params}" --one-line | cut -f2- -d">"