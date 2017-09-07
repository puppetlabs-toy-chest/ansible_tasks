#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_list_streaming_distributions+x}" ];
  then params="${params} list_streaming_distributions=\"${PT_list_streaming_distributions}\""
fi

if [ ! -z "${PT_origin_access_identity_config+x}" ];
  then params="${params} origin_access_identity_config=\"${PT_origin_access_identity_config}\""
fi

if [ ! -z "${PT_streaming_distribution_configuration+x}" ];
  then params="${params} streaming_distribution_configuration=\"${PT_streaming_distribution_configuration}\""
fi

if [ ! -z "${PT_invalidation+x}" ];
  then params="${params} invalidation=\"${PT_invalidation}\""
fi

if [ ! -z "${PT_domain_name_alias+x}" ];
  then params="${params} domain_name_alias=\"${PT_domain_name_alias}\""
fi

if [ ! -z "${PT_list_invalidations+x}" ];
  then params="${params} list_invalidations=\"${PT_list_invalidations}\""
fi

if [ ! -z "${PT_origin_access_identity_id+x}" ];
  then params="${params} origin_access_identity_id=\"${PT_origin_access_identity_id}\""
fi

if [ ! -z "${PT_list_distributions_by_web_acl_id+x}" ];
  then params="${params} list_distributions_by_web_acl_id=\"${PT_list_distributions_by_web_acl_id}\""
fi

if [ ! -z "${PT_origin_access_identity+x}" ];
  then params="${params} origin_access_identity=\"${PT_origin_access_identity}\""
fi

if [ ! -z "${PT_all_lists+x}" ];
  then params="${params} all_lists=\"${PT_all_lists}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_list_distributions+x}" ];
  then params="${params} list_distributions=\"${PT_list_distributions}\""
fi

if [ ! -z "${PT_summary+x}" ];
  then params="${params} summary=\"${PT_summary}\""
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

if [ ! -z "${PT_web_acl_id+x}" ];
  then params="${params} web_acl_id=\"${PT_web_acl_id}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_streaming_distribution+x}" ];
  then params="${params} streaming_distribution=\"${PT_streaming_distribution}\""
fi

if [ ! -z "${PT_distribution_id+x}" ];
  then params="${params} distribution_id=\"${PT_distribution_id}\""
fi

if [ ! -z "${PT_distribution_config+x}" ];
  then params="${params} distribution_config=\"${PT_distribution_config}\""
fi

if [ ! -z "${PT_invalidation_id+x}" ];
  then params="${params} invalidation_id=\"${PT_invalidation_id}\""
fi

if [ ! -z "${PT_distribution+x}" ];
  then params="${params} distribution=\"${PT_distribution}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_list_origin_access_identities+x}" ];
  then params="${params} list_origin_access_identities=\"${PT_list_origin_access_identities}\""
fi

ansible localhost -m cloudfront_facts --args "${params}" --one-line | cut -f2- -d">"