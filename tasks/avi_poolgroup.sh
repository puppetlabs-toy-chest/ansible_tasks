#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_members+x}" ];
  then params="${params} members=\"${PT_members}\""
fi

if [ ! -z "${PT_fail_action+x}" ];
  then params="${params} fail_action=\"${PT_fail_action}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_priority_labels_ref+x}" ];
  then params="${params} priority_labels_ref=\"${PT_priority_labels_ref}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_cloud_ref+x}" ];
  then params="${params} cloud_ref=\"${PT_cloud_ref}\""
fi

if [ ! -z "${PT_tenant_ref+x}" ];
  then params="${params} tenant_ref=\"${PT_tenant_ref}\""
fi

if [ ! -z "${PT_created_by+x}" ];
  then params="${params} created_by=\"${PT_created_by}\""
fi

if [ ! -z "${PT_deployment_policy_ref+x}" ];
  then params="${params} deployment_policy_ref=\"${PT_deployment_policy_ref}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_cloud_config_cksum+x}" ];
  then params="${params} cloud_config_cksum=\"${PT_cloud_config_cksum}\""
fi

if [ ! -z "${PT_min_servers+x}" ];
  then params="${params} min_servers=\"${PT_min_servers}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

ansible localhost -m avi_poolgroup --args "${params}" --one-line | cut -f2- -d">"