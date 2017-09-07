#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_enabled+x}" ];
  then params="${params} enabled=\"${PT_enabled}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_config+x}" ];
  then params="${params} config=\"${PT_config}\""
fi

ansible localhost -m jenkins_job --args "${params}" --one-line | cut -f2- -d">"