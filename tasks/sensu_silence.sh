#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_expire_on_resolve+x}" ];
  then params="${params} expire_on_resolve=\"${PT_expire_on_resolve}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_creator+x}" ];
  then params="${params} creator=\"${PT_creator}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_reason+x}" ];
  then params="${params} reason=\"${PT_reason}\""
fi

if [ ! -z "${PT_expire+x}" ];
  then params="${params} expire=\"${PT_expire}\""
fi

if [ ! -z "${PT_check+x}" ];
  then params="${params} check=\"${PT_check}\""
fi

if [ ! -z "${PT_subscription+x}" ];
  then params="${params} subscription=\"${PT_subscription}\""
fi

ansible localhost -m sensu_silence --args "${params}" --one-line | cut -f2- -d">"