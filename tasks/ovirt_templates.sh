#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_exclusive+x}" ];
  then params="${params} exclusive=\"${PT_exclusive}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_image_disk+x}" ];
  then params="${params} image_disk=\"${PT_image_disk}\""
fi

if [ ! -z "${PT_vm+x}" ];
  then params="${params} vm=\"${PT_vm}\""
fi

if [ ! -z "${PT_nested_attributes+x}" ];
  then params="${params} nested_attributes=\"${PT_nested_attributes}\""
fi

if [ ! -z "${PT_cluster+x}" ];
  then params="${params} cluster=\"${PT_cluster}\""
fi

if [ ! -z "${PT_fetch_nested+x}" ];
  then params="${params} fetch_nested=\"${PT_fetch_nested}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_storage_domain+x}" ];
  then params="${params} storage_domain=\"${PT_storage_domain}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_export_domain+x}" ];
  then params="${params} export_domain=\"${PT_export_domain}\""
fi

if [ ! -z "${PT_cpu_profile+x}" ];
  then params="${params} cpu_profile=\"${PT_cpu_profile}\""
fi

if [ ! -z "${PT_poll_interval+x}" ];
  then params="${params} poll_interval=\"${PT_poll_interval}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_image_provider+x}" ];
  then params="${params} image_provider=\"${PT_image_provider}\""
fi

if [ ! -z "${PT_clone_permissions+x}" ];
  then params="${params} clone_permissions=\"${PT_clone_permissions}\""
fi

ansible localhost -m ovirt_templates --args "${params}" --one-line | cut -f2- -d">"