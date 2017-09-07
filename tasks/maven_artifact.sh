#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_group_id+x}" ];
  then params="${params} group_id=\"${PT_group_id}\""
fi

if [ ! -z "${PT_artifact_id+x}" ];
  then params="${params} artifact_id=\"${PT_artifact_id}\""
fi

if [ ! -z "${PT_extension+x}" ];
  then params="${params} extension=\"${PT_extension}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_repository_url+x}" ];
  then params="${params} repository_url=\"${PT_repository_url}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_classifier+x}" ];
  then params="${params} classifier=\"${PT_classifier}\""
fi

ansible localhost -m maven_artifact --args "${params}" --one-line | cut -f2- -d">"