#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_pn_parameters+x}" ];
  then params="${params} pn_parameters=\"${PT_pn_parameters}\""
fi

if [ ! -z "${PT_pn_options+x}" ];
  then params="${params} pn_options=\"${PT_pn_options}\""
fi

if [ ! -z "${PT_pn_clipassword+x}" ];
  then params="${params} pn_clipassword=\"${PT_pn_clipassword}\""
fi

if [ ! -z "${PT_pn_cliswitch+x}" ];
  then params="${params} pn_cliswitch=\"${PT_pn_cliswitch}\""
fi

if [ ! -z "${PT_pn_command+x}" ];
  then params="${params} pn_command=\"${PT_pn_command}\""
fi

if [ ! -z "${PT_pn_cliusername+x}" ];
  then params="${params} pn_cliusername=\"${PT_pn_cliusername}\""
fi

ansible localhost -m pn_show --args "${params}" --one-line | cut -f2- -d">"