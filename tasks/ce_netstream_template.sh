#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_collect_interface+x}" ];
  then params="${params} collect_interface=\"${PT_collect_interface}\""
fi

if [ ! -z "${PT_record_name+x}" ];
  then params="${params} record_name=\"${PT_record_name}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_collect_counter+x}" ];
  then params="${params} collect_counter=\"${PT_collect_counter}\""
fi

if [ ! -z "${PT_match+x}" ];
  then params="${params} match=\"${PT_match}\""
fi

ansible localhost -m ce_netstream_template --args "${params}" --one-line | cut -f2- -d">"