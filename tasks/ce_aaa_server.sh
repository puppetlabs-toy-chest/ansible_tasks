#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_acct_scheme_name+x}" ];
  then params="${params} acct_scheme_name=\"${PT_acct_scheme_name}\""
fi

if [ ! -z "${PT_first_author_mode+x}" ];
  then params="${params} first_author_mode=\"${PT_first_author_mode}\""
fi

if [ ! -z "${PT_authen_scheme_name+x}" ];
  then params="${params} authen_scheme_name=\"${PT_authen_scheme_name}\""
fi

if [ ! -z "${PT_author_scheme_name+x}" ];
  then params="${params} author_scheme_name=\"${PT_author_scheme_name}\""
fi

if [ ! -z "${PT_radius_server_group+x}" ];
  then params="${params} radius_server_group=\"${PT_radius_server_group}\""
fi

if [ ! -z "${PT_domain_name+x}" ];
  then params="${params} domain_name=\"${PT_domain_name}\""
fi

if [ ! -z "${PT_first_authen_mode+x}" ];
  then params="${params} first_authen_mode=\"${PT_first_authen_mode}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_local_user_group+x}" ];
  then params="${params} local_user_group=\"${PT_local_user_group}\""
fi

if [ ! -z "${PT_hwtacas_template+x}" ];
  then params="${params} hwtacas_template=\"${PT_hwtacas_template}\""
fi

if [ ! -z "${PT_accounting_mode+x}" ];
  then params="${params} accounting_mode=\"${PT_accounting_mode}\""
fi

ansible localhost -m ce_aaa_server --args "${params}" --one-line | cut -f2- -d">"