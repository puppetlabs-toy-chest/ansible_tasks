#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_jenkins_home+x}" ];
  then params="${params} jenkins_home=\"${PT_jenkins_home}\""
fi

if [ ! -z "${PT_group+x}" ];
  then params="${params} group=\"${PT_group}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_updates_url+x}" ];
  then params="${params} updates_url=\"${PT_updates_url}\""
fi

if [ ! -z "${PT_with_dependencies+x}" ];
  then params="${params} with_dependencies=\"${PT_with_dependencies}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_params+x}" ];
  then params="${params} params=\"${PT_params}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_owner+x}" ];
  then params="${params} owner=\"${PT_owner}\""
fi

if [ ! -z "${PT_updates_expiration+x}" ];
  then params="${params} updates_expiration=\"${PT_updates_expiration}\""
fi

ansible localhost -m jenkins_plugin --args "${params}" --one-line | cut -f2- -d">"