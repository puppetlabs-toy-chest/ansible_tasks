#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_status+x}" ];
  then params="${params} status=\"${PT_status}\""
fi

if [ ! -z "${PT_project+x}" ];
  then params="${params} project=\"${PT_project}\""
fi

if [ ! -z "${PT_severity+x}" ];
  then params="${params} severity=\"${PT_severity}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_priority+x}" ];
  then params="${params} priority=\"${PT_priority}\""
fi

if [ ! -z "${PT_taiga_host+x}" ];
  then params="${params} taiga_host=\"${PT_taiga_host}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_attachment+x}" ];
  then params="${params} attachment=\"${PT_attachment}\""
fi

if [ ! -z "${PT_issue_type+x}" ];
  then params="${params} issue_type=\"${PT_issue_type}\""
fi

if [ ! -z "${PT_subject+x}" ];
  then params="${params} subject=\"${PT_subject}\""
fi

if [ ! -z "${PT_attachment_description+x}" ];
  then params="${params} attachment_description=\"${PT_attachment_description}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

ansible localhost -m taiga_issue --args "${params}" --one-line | cut -f2- -d">"