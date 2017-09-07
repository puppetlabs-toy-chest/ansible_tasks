#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_rollback+x}" ];
  then params="${params} rollback=\"${PT_rollback}\""
fi

if [ ! -z "${PT_confirm+x}" ];
  then params="${params} confirm=\"${PT_confirm}\""
fi

if [ ! -z "${PT_lines+x}" ];
  then params="${params} lines=\"${PT_lines}\""
fi

if [ ! -z "${PT_update+x}" ];
  then params="${params} update=\"${PT_update}\""
fi

if [ ! -z "${PT_replace+x}" ];
  then params="${params} replace=\"${PT_replace}\""
fi

if [ ! -z "${PT_zeroize+x}" ];
  then params="${params} zeroize=\"${PT_zeroize}\""
fi

if [ ! -z "${PT_src_format+x}" ];
  then params="${params} src_format=\"${PT_src_format}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_backup+x}" ];
  then params="${params} backup=\"${PT_backup}\""
fi

ansible localhost -m junos_config --args "${params}" --one-line | cut -f2- -d">"