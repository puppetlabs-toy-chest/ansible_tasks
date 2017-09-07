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

if [ ! -z "${PT_reuse_existing_ip_allowed+x}" ];
  then params="${params} reuse_existing_ip_allowed=\"${PT_reuse_existing_ip_allowed}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_public_ip+x}" ];
  then params="${params} public_ip=\"${PT_public_ip}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_in_vpc+x}" ];
  then params="${params} in_vpc=\"${PT_in_vpc}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_private_ip_address+x}" ];
  then params="${params} private_ip_address=\"${PT_private_ip_address}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_release_on_disassociation+x}" ];
  then params="${params} release_on_disassociation=\"${PT_release_on_disassociation}\""
fi

if [ ! -z "${PT_device_id+x}" ];
  then params="${params} device_id=\"${PT_device_id}\""
fi

ansible localhost -m ec2_eip --args "${params}" --one-line | cut -f2- -d">"