#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_startup_query_interval+x}" ];
  then params="${params} startup_query_interval=\"${PT_startup_query_interval}\""
fi

if [ ! -z "${PT_group_timeout+x}" ];
  then params="${params} group_timeout=\"${PT_group_timeout}\""
fi

if [ ! -z "${PT_oif_routemap+x}" ];
  then params="${params} oif_routemap=\"${PT_oif_routemap}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_oif_prefix+x}" ];
  then params="${params} oif_prefix=\"${PT_oif_prefix}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_querier_timeout+x}" ];
  then params="${params} querier_timeout=\"${PT_querier_timeout}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

if [ ! -z "${PT_report_llg+x}" ];
  then params="${params} report_llg=\"${PT_report_llg}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_last_member_qrt+x}" ];
  then params="${params} last_member_qrt=\"${PT_last_member_qrt}\""
fi

if [ ! -z "${PT_robustness+x}" ];
  then params="${params} robustness=\"${PT_robustness}\""
fi

if [ ! -z "${PT_startup_query_count+x}" ];
  then params="${params} startup_query_count=\"${PT_startup_query_count}\""
fi

if [ ! -z "${PT_immediate_leave+x}" ];
  then params="${params} immediate_leave=\"${PT_immediate_leave}\""
fi

if [ ! -z "${PT_last_member_query_count+x}" ];
  then params="${params} last_member_query_count=\"${PT_last_member_query_count}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_restart+x}" ];
  then params="${params} restart=\"${PT_restart}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_oif_source+x}" ];
  then params="${params} oif_source=\"${PT_oif_source}\""
fi

if [ ! -z "${PT_query_interval+x}" ];
  then params="${params} query_interval=\"${PT_query_interval}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_query_mrt+x}" ];
  then params="${params} query_mrt=\"${PT_query_mrt}\""
fi

ansible localhost -m nxos_igmp_interface --args "${params}" --one-line | cut -f2- -d">"