#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_statistics_direction+x}" ];
  then params="${params} statistics_direction=\"${PT_statistics_direction}\""
fi

if [ ! -z "${PT_index_switch+x}" ];
  then params="${params} index_switch=\"${PT_index_switch}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_sampler_interval+x}" ];
  then params="${params} sampler_interval=\"${PT_sampler_interval}\""
fi

if [ ! -z "${PT_statistics_record+x}" ];
  then params="${params} statistics_record=\"${PT_statistics_record}\""
fi

if [ ! -z "${PT_sampler_direction+x}" ];
  then params="${params} sampler_direction=\"${PT_sampler_direction}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

ansible localhost -m ce_netstream_global --args "${params}" --one-line | cut -f2- -d">"