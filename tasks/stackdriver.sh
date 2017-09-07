#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_repository+x}" ];
  then params="${params} repository=\"${PT_repository}\""
fi

if [ ! -z "${PT_level+x}" ];
  then params="${params} level=\"${PT_level}\""
fi

if [ ! -z "${PT_annotated_by+x}" ];
  then params="${params} annotated_by=\"${PT_annotated_by}\""
fi

if [ ! -z "${PT_deployed_to+x}" ];
  then params="${params} deployed_to=\"${PT_deployed_to}\""
fi

if [ ! -z "${PT_deployed_by+x}" ];
  then params="${params} deployed_by=\"${PT_deployed_by}\""
fi

if [ ! -z "${PT_instance_id+x}" ];
  then params="${params} instance_id=\"${PT_instance_id}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_event_epoch+x}" ];
  then params="${params} event_epoch=\"${PT_event_epoch}\""
fi

if [ ! -z "${PT_revision_id+x}" ];
  then params="${params} revision_id=\"${PT_revision_id}\""
fi

if [ ! -z "${PT_event+x}" ];
  then params="${params} event=\"${PT_event}\""
fi

ansible localhost -m stackdriver --args "${params}" --one-line | cut -f2- -d">"