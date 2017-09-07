#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_dns_servers+x}" ];
  then params="${params} dns_servers=\"${PT_dns_servers}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_ntp_servers+x}" ];
  then params="${params} ntp_servers=\"${PT_ntp_servers}\""
fi

if [ ! -z "${PT_netbios_node_type+x}" ];
  then params="${params} netbios_node_type=\"${PT_netbios_node_type}\""
fi

if [ ! -z "${PT_ec2_url+x}" ];
  then params="${params} ec2_url=\"${PT_ec2_url}\""
fi

if [ ! -z "${PT_inherit_existing+x}" ];
  then params="${params} inherit_existing=\"${PT_inherit_existing}\""
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

if [ ! -z "${PT_domain_name+x}" ];
  then params="${params} domain_name=\"${PT_domain_name}\""
fi

if [ ! -z "${PT_delete_old+x}" ];
  then params="${params} delete_old=\"${PT_delete_old}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_vpc_id+x}" ];
  then params="${params} vpc_id=\"${PT_vpc_id}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_dhcp_options_id+x}" ];
  then params="${params} dhcp_options_id=\"${PT_dhcp_options_id}\""
fi

if [ ! -z "${PT_netbios_name_servers+x}" ];
  then params="${params} netbios_name_servers=\"${PT_netbios_name_servers}\""
fi

ansible localhost -m ec2_vpc_dhcp_options --args "${params}" --one-line | cut -f2- -d">"