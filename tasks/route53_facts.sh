#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_resource_id+x}" ];
  then params="${params} resource_id=\"${PT_resource_id}\""
fi

if [ ! -z "${PT_hosted_zone_method+x}" ];
  then params="${params} hosted_zone_method=\"${PT_hosted_zone_method}\""
fi

if [ ! -z "${PT_health_check_method+x}" ];
  then params="${params} health_check_method=\"${PT_health_check_method}\""
fi

if [ ! -z "${PT_delegation_set_id+x}" ];
  then params="${params} delegation_set_id=\"${PT_delegation_set_id}\""
fi

if [ ! -z "${PT_hosted_zone_id+x}" ];
  then params="${params} hosted_zone_id=\"${PT_hosted_zone_id}\""
fi

if [ ! -z "${PT_health_check_id+x}" ];
  then params="${params} health_check_id=\"${PT_health_check_id}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_query+x}" ];
  then params="${params} query=\"${PT_query}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_start_record_name+x}" ];
  then params="${params} start_record_name=\"${PT_start_record_name}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_dns_name+x}" ];
  then params="${params} dns_name=\"${PT_dns_name}\""
fi

if [ ! -z "${PT_max_items+x}" ];
  then params="${params} max_items=\"${PT_max_items}\""
fi

if [ ! -z "${PT_change_id+x}" ];
  then params="${params} change_id=\"${PT_change_id}\""
fi

if [ ! -z "${PT_next_marker+x}" ];
  then params="${params} next_marker=\"${PT_next_marker}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m route53_facts --args "${params}" --one-line | cut -f2- -d">"