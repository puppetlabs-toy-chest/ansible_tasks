#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_disable_rollback+x}" ];
  then params="${params} disable_rollback=\"${PT_disable_rollback}\""
fi

if [ ! -z "${PT_notification_arns+x}" ];
  then params="${params} notification_arns=\"${PT_notification_arns}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_stack_name+x}" ];
  then params="${params} stack_name=\"${PT_stack_name}\""
fi

if [ ! -z "${PT_template_url+x}" ];
  then params="${params} template_url=\"${PT_template_url}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_role_arn+x}" ];
  then params="${params} role_arn=\"${PT_role_arn}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_stack_policy+x}" ];
  then params="${params} stack_policy=\"${PT_stack_policy}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_template_format+x}" ];
  then params="${params} template_format=\"${PT_template_format}\""
fi

if [ ! -z "${PT_template_parameters+x}" ];
  then params="${params} template_parameters=\"${PT_template_parameters}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_template+x}" ];
  then params="${params} template=\"${PT_template}\""
fi

if [ ! -z "${PT_changeset_name+x}" ];
  then params="${params} changeset_name=\"${PT_changeset_name}\""
fi

if [ ! -z "${PT_create_changeset+x}" ];
  then params="${params} create_changeset=\"${PT_create_changeset}\""
fi

ansible localhost -m cloudformation --args "${params}" --one-line | cut -f2- -d">"