#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_repeat+x}" ];
  then params="${params} repeat=\"${PT_repeat}\""
fi

if [ ! -z "${PT_desired_count+x}" ];
  then params="${params} desired_count=\"${PT_desired_count}\""
fi

if [ ! -z "${PT_cluster+x}" ];
  then params="${params} cluster=\"${PT_cluster}\""
fi

if [ ! -z "${PT_deployment_configuration+x}" ];
  then params="${params} deployment_configuration=\"${PT_deployment_configuration}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_load_balancers+x}" ];
  then params="${params} load_balancers=\"${PT_load_balancers}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_placement_constraints+x}" ];
  then params="${params} placement_constraints=\"${PT_placement_constraints}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_delay+x}" ];
  then params="${params} delay=\"${PT_delay}\""
fi

if [ ! -z "${PT_task_definition+x}" ];
  then params="${params} task_definition=\"${PT_task_definition}\""
fi

if [ ! -z "${PT_role+x}" ];
  then params="${params} role=\"${PT_role}\""
fi

if [ ! -z "${PT_client_token+x}" ];
  then params="${params} client_token=\"${PT_client_token}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_placement_strategy+x}" ];
  then params="${params} placement_strategy=\"${PT_placement_strategy}\""
fi

ansible localhost -m ecs_service --args "${params}" --one-line | cut -f2- -d">"