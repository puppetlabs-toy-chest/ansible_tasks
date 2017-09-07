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

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_snapshot_ids+x}" ];
  then params="${params} snapshot_ids=\"${PT_snapshot_ids}\""
fi

if [ ! -z "${PT_filters+x}" ];
  then params="${params} filters=\"${PT_filters}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_restorable_by_user_ids+x}" ];
  then params="${params} restorable_by_user_ids=\"${PT_restorable_by_user_ids}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_owner_ids+x}" ];
  then params="${params} owner_ids=\"${PT_owner_ids}\""
fi

ansible localhost -m ec2_snapshot_facts --args "${params}" --one-line | cut -f2- -d">"