#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_merge_requests_enabled+x}" ];
  then params="${params} merge_requests_enabled=\"${PT_merge_requests_enabled}\""
fi

if [ ! -z "${PT_import_url+x}" ];
  then params="${params} import_url=\"${PT_import_url}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_server_url+x}" ];
  then params="${params} server_url=\"${PT_server_url}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_group+x}" ];
  then params="${params} group=\"${PT_group}\""
fi

if [ ! -z "${PT_wiki_enabled+x}" ];
  then params="${params} wiki_enabled=\"${PT_wiki_enabled}\""
fi

if [ ! -z "${PT_visibility_level+x}" ];
  then params="${params} visibility_level=\"${PT_visibility_level}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_snippets_enabled+x}" ];
  then params="${params} snippets_enabled=\"${PT_snippets_enabled}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_login_token+x}" ];
  then params="${params} login_token=\"${PT_login_token}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_issues_enabled+x}" ];
  then params="${params} issues_enabled=\"${PT_issues_enabled}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_public+x}" ];
  then params="${params} public=\"${PT_public}\""
fi

ansible localhost -m gitlab_project --args "${params}" --one-line | cut -f2- -d">"