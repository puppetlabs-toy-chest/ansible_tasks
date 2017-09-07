#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_entity_id+x}" ];
  then params="${params} entity_id=\"${PT_entity_id}\""
fi

if [ ! -z "${PT_check_type+x}" ];
  then params="${params} check_type=\"${PT_check_type}\""
fi

if [ ! -z "${PT_tenant_name+x}" ];
  then params="${params} tenant_name=\"${PT_tenant_name}\""
fi

if [ ! -z "${PT_period+x}" ];
  then params="${params} period=\"${PT_period}\""
fi

if [ ! -z "${PT_disabled+x}" ];
  then params="${params} disabled=\"${PT_disabled}\""
fi

if [ ! -z "${PT_verify_ssl+x}" ];
  then params="${params} verify_ssl=\"${PT_verify_ssl}\""
fi

if [ ! -z "${PT_credentials+x}" ];
  then params="${params} credentials=\"${PT_credentials}\""
fi

if [ ! -z "${PT_auth_endpoint+x}" ];
  then params="${params} auth_endpoint=\"${PT_auth_endpoint}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_target_alias+x}" ];
  then params="${params} target_alias=\"${PT_target_alias}\""
fi

if [ ! -z "${PT_identity_type+x}" ];
  then params="${params} identity_type=\"${PT_identity_type}\""
fi

if [ ! -z "${PT_tenant_id+x}" ];
  then params="${params} tenant_id=\"${PT_tenant_id}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_target_hostname+x}" ];
  then params="${params} target_hostname=\"${PT_target_hostname}\""
fi

if [ ! -z "${PT_label+x}" ];
  then params="${params} label=\"${PT_label}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_details+x}" ];
  then params="${params} details=\"${PT_details}\""
fi

if [ ! -z "${PT_env+x}" ];
  then params="${params} env=\"${PT_env}\""
fi

if [ ! -z "${PT_monitoring_zones_poll+x}" ];
  then params="${params} monitoring_zones_poll=\"${PT_monitoring_zones_poll}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

if [ ! -z "${PT_metadata+x}" ];
  then params="${params} metadata=\"${PT_metadata}\""
fi

ansible localhost -m rax_mon_check --args "${params}" --one-line | cut -f2- -d">"