#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_servicegroup+x}" ];
  then params="${params} servicegroup=\"${PT_servicegroup}\""
fi

if [ ! -z "${PT_author+x}" ];
  then params="${params} author=\"${PT_author}\""
fi

if [ ! -z "${PT_action+x}" ];
  then params="${params} action=\"${PT_action}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_services+x}" ];
  then params="${params} services=\"${PT_services}\""
fi

if [ ! -z "${PT_minutes+x}" ];
  then params="${params} minutes=\"${PT_minutes}\""
fi

if [ ! -z "${PT_cmdfile+x}" ];
  then params="${params} cmdfile=\"${PT_cmdfile}\""
fi

ansible localhost -m nagios --args "${params}" --one-line | cut -f2- -d">"