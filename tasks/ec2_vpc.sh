#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_subnets+x}" ];
  then params="${params} subnets=\"${PT_subnets}\""
fi

if [ ! -z "${PT_internet_gateway+x}" ];
  then params="${params} internet_gateway=\"${PT_internet_gateway}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_dns_hostnames+x}" ];
  then params="${params} dns_hostnames=\"${PT_dns_hostnames}\""
fi

if [ ! -z "${PT_resource_tags+x}" ];
  then params="${params} resource_tags=\"${PT_resource_tags}\""
fi

if [ ! -z "${PT_cidr_block+x}" ];
  then params="${params} cidr_block=\"${PT_cidr_block}\""
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

if [ ! -z "${PT_route_tables+x}" ];
  then params="${params} route_tables=\"${PT_route_tables}\""
fi

if [ ! -z "${PT_dns_support+x}" ];
  then params="${params} dns_support=\"${PT_dns_support}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_instance_tenancy+x}" ];
  then params="${params} instance_tenancy=\"${PT_instance_tenancy}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_vpc_id+x}" ];
  then params="${params} vpc_id=\"${PT_vpc_id}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m ec2_vpc --args "${params}" --one-line | cut -f2- -d">"