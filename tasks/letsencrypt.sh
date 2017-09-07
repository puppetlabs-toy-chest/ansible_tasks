#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_acme_directory+x}" ];
  then params="${params} acme_directory=\"${PT_acme_directory}\""
fi

if [ ! -z "${PT_account_email+x}" ];
  then params="${params} account_email=\"${PT_account_email}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_data+x}" ];
  then params="${params} data=\"${PT_data}\""
fi

if [ ! -z "${PT_challenge+x}" ];
  then params="${params} challenge=\"${PT_challenge}\""
fi

if [ ! -z "${PT_agreement+x}" ];
  then params="${params} agreement=\"${PT_agreement}\""
fi

if [ ! -z "${PT_account_key+x}" ];
  then params="${params} account_key=\"${PT_account_key}\""
fi

if [ ! -z "${PT_remaining_days+x}" ];
  then params="${params} remaining_days=\"${PT_remaining_days}\""
fi

if [ ! -z "${PT_csr+x}" ];
  then params="${params} csr=\"${PT_csr}\""
fi

ansible localhost -m letsencrypt --args "${params}" --one-line | cut -f2- -d">"