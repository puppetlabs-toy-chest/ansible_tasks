#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_displayname+x}" ];
  then params="${params} displayname=\"${PT_displayname}\""
fi

if [ ! -z "${PT_target+x}" ];
  then params="${params} target=\"${PT_target}\""
fi

if [ ! -z "${PT_company+x}" ];
  then params="${params} company=\"${PT_company}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_fullpath+x}" ];
  then params="${params} fullpath=\"${PT_fullpath}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_collector+x}" ];
  then params="${params} collector=\"${PT_collector}\""
fi

ansible localhost -m logicmonitor_facts --args "${params}" --one-line | cut -f2- -d">"