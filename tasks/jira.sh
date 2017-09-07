#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_assignee+x}" ];
  then params="${params} assignee=\"${PT_assignee}\""
fi

if [ ! -z "${PT_inwardissue+x}" ];
  then params="${params} inwardissue=\"${PT_inwardissue}\""
fi

if [ ! -z "${PT_operation+x}" ];
  then params="${params} operation=\"${PT_operation}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_linktype+x}" ];
  then params="${params} linktype=\"${PT_linktype}\""
fi

if [ ! -z "${PT_fields+x}" ];
  then params="${params} fields=\"${PT_fields}\""
fi

if [ ! -z "${PT_outwardissue+x}" ];
  then params="${params} outwardissue=\"${PT_outwardissue}\""
fi

if [ ! -z "${PT_uri+x}" ];
  then params="${params} uri=\"${PT_uri}\""
fi

if [ ! -z "${PT_summary+x}" ];
  then params="${params} summary=\"${PT_summary}\""
fi

if [ ! -z "${PT_project+x}" ];
  then params="${params} project=\"${PT_project}\""
fi

if [ ! -z "${PT_status+x}" ];
  then params="${params} status=\"${PT_status}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_issuetype+x}" ];
  then params="${params} issuetype=\"${PT_issuetype}\""
fi

if [ ! -z "${PT_issue+x}" ];
  then params="${params} issue=\"${PT_issue}\""
fi

ansible localhost -m jira --args "${params}" --one-line | cut -f2- -d">"