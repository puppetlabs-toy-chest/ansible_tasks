#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_link_local_grp_supp+x}" ];
  then params="${params} link_local_grp_supp=\"${PT_link_local_grp_supp}\""
fi

if [ ! -z "${PT_report_supp+x}" ];
  then params="${params} report_supp=\"${PT_report_supp}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_snooping+x}" ];
  then params="${params} snooping=\"${PT_snooping}\""
fi

if [ ! -z "${PT_group_timeout+x}" ];
  then params="${params} group_timeout=\"${PT_group_timeout}\""
fi

if [ ! -z "${PT_v3_report_supp+x}" ];
  then params="${params} v3_report_supp=\"${PT_v3_report_supp}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

ansible localhost -m nxos_igmp_snooping --args "${params}" --one-line | cut -f2- -d">"