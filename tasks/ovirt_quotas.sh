#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_cluster_grace+x}" ];
  then params="${params} cluster_grace=\"${PT_cluster_grace}\""
fi

if [ ! -z "${PT_nested_attributes+x}" ];
  then params="${params} nested_attributes=\"${PT_nested_attributes}\""
fi

if [ ! -z "${PT_fetch_nested+x}" ];
  then params="${params} fetch_nested=\"${PT_fetch_nested}\""
fi

if [ ! -z "${PT_storage_grace+x}" ];
  then params="${params} storage_grace=\"${PT_storage_grace}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_storage_threshold+x}" ];
  then params="${params} storage_threshold=\"${PT_storage_threshold}\""
fi

if [ ! -z "${PT_data_center+x}" ];
  then params="${params} data_center=\"${PT_data_center}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
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

if [ ! -z "${PT_cluster_threshold+x}" ];
  then params="${params} cluster_threshold=\"${PT_cluster_threshold}\""
fi

if [ ! -z "${PT_clusters+x}" ];
  then params="${params} clusters=\"${PT_clusters}\""
fi

if [ ! -z "${PT_storages+x}" ];
  then params="${params} storages=\"${PT_storages}\""
fi

ansible localhost -m ovirt_quotas --args "${params}" --one-line | cut -f2- -d">"