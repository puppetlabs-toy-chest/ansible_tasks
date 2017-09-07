#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_eip_address+x}" ];
  then params="${params} eip_address=\"${PT_eip_address}\""
fi

if [ ! -z "${PT_if_exist_do_not_create+x}" ];
  then params="${params} if_exist_do_not_create=\"${PT_if_exist_do_not_create}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_release_eip+x}" ];
  then params="${params} release_eip=\"${PT_release_eip}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_nat_gateway_id+x}" ];
  then params="${params} nat_gateway_id=\"${PT_nat_gateway_id}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_allocation_id+x}" ];
  then params="${params} allocation_id=\"${PT_allocation_id}\""
fi

if [ ! -z "${PT_subnet_id+x}" ];
  then params="${params} subnet_id=\"${PT_subnet_id}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_client_token+x}" ];
  then params="${params} client_token=\"${PT_client_token}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m ec2_vpc_nat_gateway --args "${params}" --one-line | cut -f2- -d">"