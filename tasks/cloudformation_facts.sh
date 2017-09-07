#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_stack_template+x}" ];
  then params="${params} stack_template=\"${PT_stack_template}\""
fi

if [ ! -z "${PT_all_facts+x}" ];
  then params="${params} all_facts=\"${PT_all_facts}\""
fi

if [ ! -z "${PT_stack_policy+x}" ];
  then params="${params} stack_policy=\"${PT_stack_policy}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_stack_events+x}" ];
  then params="${params} stack_events=\"${PT_stack_events}\""
fi

if [ ! -z "${PT_stack_name+x}" ];
  then params="${params} stack_name=\"${PT_stack_name}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_stack_resources+x}" ];
  then params="${params} stack_resources=\"${PT_stack_resources}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m cloudformation_facts --args "${params}" --one-line | cut -f2- -d">"