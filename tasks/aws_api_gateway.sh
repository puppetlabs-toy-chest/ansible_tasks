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

if [ ! -z "${PT_swagger_file+x}" ];
  then params="${params} swagger_file=\"${PT_swagger_file}\""
fi

if [ ! -z "${PT_swagger_dict+x}" ];
  then params="${params} swagger_dict=\"${PT_swagger_dict}\""
fi

if [ ! -z "${PT_deploy_desc+x}" ];
  then params="${params} deploy_desc=\"${PT_deploy_desc}\""
fi

if [ ! -z "${PT_api_id+x}" ];
  then params="${params} api_id=\"${PT_api_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_swagger_text+x}" ];
  then params="${params} swagger_text=\"${PT_swagger_text}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_stage+x}" ];
  then params="${params} stage=\"${PT_stage}\""
fi

ansible localhost -m aws_api_gateway --args "${params}" --one-line | cut -f2- -d">"