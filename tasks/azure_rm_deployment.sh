#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_wait_for_deployment_completion+x}" ];
  then params="${params} wait_for_deployment_completion=\"${PT_wait_for_deployment_completion}\""
fi

if [ ! -z "${PT_deployment_name+x}" ];
  then params="${params} deployment_name=\"${PT_deployment_name}\""
fi

if [ ! -z "${PT_wait_for_deployment_polling_period+x}" ];
  then params="${params} wait_for_deployment_polling_period=\"${PT_wait_for_deployment_polling_period}\""
fi

if [ ! -z "${PT_template_link+x}" ];
  then params="${params} template_link=\"${PT_template_link}\""
fi

if [ ! -z "${PT_client_id+x}" ];
  then params="${params} client_id=\"${PT_client_id}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_deployment_mode+x}" ];
  then params="${params} deployment_mode=\"${PT_deployment_mode}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_resource_group_name+x}" ];
  then params="${params} resource_group_name=\"${PT_resource_group_name}\""
fi

if [ ! -z "${PT_parameters+x}" ];
  then params="${params} parameters=\"${PT_parameters}\""
fi

if [ ! -z "${PT_ad_user+x}" ];
  then params="${params} ad_user=\"${PT_ad_user}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_secret+x}" ];
  then params="${params} secret=\"${PT_secret}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_template+x}" ];
  then params="${params} template=\"${PT_template}\""
fi

if [ ! -z "${PT_parameters_link+x}" ];
  then params="${params} parameters_link=\"${PT_parameters_link}\""
fi

if [ ! -z "${PT_subscription_id+x}" ];
  then params="${params} subscription_id=\"${PT_subscription_id}\""
fi

ansible localhost -m azure_rm_deployment --args "${params}" --one-line | cut -f2- -d">"