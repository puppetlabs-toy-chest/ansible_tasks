#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_validate_checksum+x}" ];
  then params="${params} validate_checksum=\"${PT_validate_checksum}\""
fi

if [ ! -z "${PT_fail_on_missing+x}" ];
  then params="${params} fail_on_missing=\"${PT_fail_on_missing}\""
fi

if [ ! -z "${PT_flat+x}" ];
  then params="${params} flat=\"${PT_flat}\""
fi

ansible localhost -m fetch --args "${params}" --one-line | cut -f2- -d">"