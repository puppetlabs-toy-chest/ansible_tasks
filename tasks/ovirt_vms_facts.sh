#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_all_content+x}" ];
  then params="${params} all_content=\"${PT_all_content}\""
fi

if [ ! -z "${PT_fetch_nested+x}" ];
  then params="${params} fetch_nested=\"${PT_fetch_nested}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_max+x}" ];
  then params="${params} max=\"${PT_max}\""
fi

if [ ! -z "${PT_pattern+x}" ];
  then params="${params} pattern=\"${PT_pattern}\""
fi

if [ ! -z "${PT_nested_attributes+x}" ];
  then params="${params} nested_attributes=\"${PT_nested_attributes}\""
fi

if [ ! -z "${PT_case_sensitive+x}" ];
  then params="${params} case_sensitive=\"${PT_case_sensitive}\""
fi

ansible localhost -m ovirt_vms_facts --args "${params}" --one-line | cut -f2- -d">"