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

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_purge_subnets+x}" ];
  then params="${params} purge_subnets=\"${PT_purge_subnets}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_route_table_id+x}" ];
  then params="${params} route_table_id=\"${PT_route_table_id}\""
fi

if [ ! -z "${PT_propagating_vgw_ids+x}" ];
  then params="${params} propagating_vgw_ids=\"${PT_propagating_vgw_ids}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_purge_routes+x}" ];
  then params="${params} purge_routes=\"${PT_purge_routes}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_lookup+x}" ];
  then params="${params} lookup=\"${PT_lookup}\""
fi

if [ ! -z "${PT_routes+x}" ];
  then params="${params} routes=\"${PT_routes}\""
fi

if [ ! -z "${PT_vpc_id+x}" ];
  then params="${params} vpc_id=\"${PT_vpc_id}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m ec2_vpc_route_table --args "${params}" --one-line | cut -f2- -d">"