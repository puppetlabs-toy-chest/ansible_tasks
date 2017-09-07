#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_repo+x}" ];
  then params="${params} repo=\"${PT_repo}\""
fi

if [ ! -z "${PT_organization+x}" ];
  then params="${params} organization=\"${PT_organization}\""
fi

if [ ! -z "${PT_issue+x}" ];
  then params="${params} issue=\"${PT_issue}\""
fi

if [ ! -z "${PT_action+x}" ];
  then params="${params} action=\"${PT_action}\""
fi

ansible localhost -m github_issue --args "${params}" --one-line | cut -f2- -d">"