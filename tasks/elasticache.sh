#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_engine+x}" ];
  then params="${params} engine=\"${PT_engine}\""
fi

if [ ! -z "${PT_cache_engine_version+x}" ];
  then params="${params} cache_engine_version=\"${PT_cache_engine_version}\""
fi

if [ ! -z "${PT_aws_access_key+x}" ];
  then params="${params} aws_access_key=\"${PT_aws_access_key}\""
fi

if [ ! -z "${PT_node_type+x}" ];
  then params="${params} node_type=\"${PT_node_type}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_security_group_ids+x}" ];
  then params="${params} security_group_ids=\"${PT_security_group_ids}\""
fi

if [ ! -z "${PT_num_nodes+x}" ];
  then params="${params} num_nodes=\"${PT_num_nodes}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_aws_secret_key+x}" ];
  then params="${params} aws_secret_key=\"${PT_aws_secret_key}\""
fi

if [ ! -z "${PT_cache_port+x}" ];
  then params="${params} cache_port=\"${PT_cache_port}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_hard_modify+x}" ];
  then params="${params} hard_modify=\"${PT_hard_modify}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_cache_security_groups+x}" ];
  then params="${params} cache_security_groups=\"${PT_cache_security_groups}\""
fi

if [ ! -z "${PT_cache_subnet_group+x}" ];
  then params="${params} cache_subnet_group=\"${PT_cache_subnet_group}\""
fi

if [ ! -z "${PT_security_token+x}" ];
  then params="${params} security_token=\"${PT_security_token}\""
fi

if [ ! -z "${PT_cache_parameter_group+x}" ];
  then params="${params} cache_parameter_group=\"${PT_cache_parameter_group}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m elasticache --args "${params}" --one-line | cut -f2- -d">"