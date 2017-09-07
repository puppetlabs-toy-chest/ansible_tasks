#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_dns_support+x}" ];
  then params="${params} dns_support=\"${PT_dns_support}\""
fi

if [ ! -z "${PT_multi_ok+x}" ];
  then params="${params} multi_ok=\"${PT_multi_ok}\""
fi

if [ ! -z "${PT_tenancy+x}" ];
  then params="${params} tenancy=\"${PT_tenancy}\""
fi

if [ ! -z "${PT_dns_hostnames+x}" ];
  then params="${params} dns_hostnames=\"${PT_dns_hostnames}\""
fi

if [ ! -z "${PT_cidr_block+x}" ];
  then params="${params} cidr_block=\"${PT_cidr_block}\""
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

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_dhcp_opts_id+x}" ];
  then params="${params} dhcp_opts_id=\"${PT_dhcp_opts_id}\""
fi

ansible localhost -m ec2_vpc_net --args "${params}" --one-line | cut -f2- -d">"