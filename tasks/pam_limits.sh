#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_use_max+x}" ];
  then params="${params} use_max=\"${PT_use_max}\""
fi

if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

if [ ! -z "${PT_use_min+x}" ];
  then params="${params} use_min=\"${PT_use_min}\""
fi

if [ ! -z "${PT_limit_item+x}" ];
  then params="${params} limit_item=\"${PT_limit_item}\""
fi

if [ ! -z "${PT_limit_type+x}" ];
  then params="${params} limit_type=\"${PT_limit_type}\""
fi

if [ ! -z "${PT_backup+x}" ];
  then params="${params} backup=\"${PT_backup}\""
fi

ansible localhost -m pam_limits --args "${params}" --one-line | cut -f2- -d">"