#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_health_check+x}" ];
  then params="${params} health_check=\"${PT_health_check}\""
fi

if [ ! -z "${PT_weight+x}" ];
  then params="${params} weight=\"${PT_weight}\""
fi

if [ ! -z "${PT_ttl+x}" ];
  then params="${params} ttl=\"${PT_ttl}\""
fi

if [ ! -z "${PT_hosted_zone_id+x}" ];
  then params="${params} hosted_zone_id=\"${PT_hosted_zone_id}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_overwrite+x}" ];
  then params="${params} overwrite=\"${PT_overwrite}\""
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

if [ ! -z "${PT_identifier+x}" ];
  then params="${params} identifier=\"${PT_identifier}\""
fi

if [ ! -z "${PT_alias_hosted_zone_id+x}" ];
  then params="${params} alias_hosted_zone_id=\"${PT_alias_hosted_zone_id}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_alias+x}" ];
  then params="${params} alias=\"${PT_alias}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_retry_interval+x}" ];
  then params="${params} retry_interval=\"${PT_retry_interval}\""
fi

if [ ! -z "${PT_private_zone+x}" ];
  then params="${params} private_zone=\"${PT_private_zone}\""
fi

if [ ! -z "${PT_value+x}" ];
  then params="${params} value=\"${PT_value}\""
fi

if [ ! -z "${PT_record+x}" ];
  then params="${params} record=\"${PT_record}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_alias_evaluate_target_health+x}" ];
  then params="${params} alias_evaluate_target_health=\"${PT_alias_evaluate_target_health}\""
fi

if [ ! -z "${PT_vpc_id+x}" ];
  then params="${params} vpc_id=\"${PT_vpc_id}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_failover+x}" ];
  then params="${params} failover=\"${PT_failover}\""
fi

ansible localhost -m route53 --args "${params}" --one-line | cut -f2- -d">"