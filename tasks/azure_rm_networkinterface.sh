#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_resource_group+x}" ];
  then params="${params} resource_group=\"${PT_resource_group}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_virtual_network_name+x}" ];
  then params="${params} virtual_network_name=\"${PT_virtual_network_name}\""
fi

if [ ! -z "${PT_public_ip_allocation_method+x}" ];
  then params="${params} public_ip_allocation_method=\"${PT_public_ip_allocation_method}\""
fi

if [ ! -z "${PT_open_ports+x}" ];
  then params="${params} open_ports=\"${PT_open_ports}\""
fi

if [ ! -z "${PT_public_ip+x}" ];
  then params="${params} public_ip=\"${PT_public_ip}\""
fi

if [ ! -z "${PT_private_ip_address+x}" ];
  then params="${params} private_ip_address=\"${PT_private_ip_address}\""
fi

if [ ! -z "${PT_client_id+x}" ];
  then params="${params} client_id=\"${PT_client_id}\""
fi

if [ ! -z "${PT_security_group_name+x}" ];
  then params="${params} security_group_name=\"${PT_security_group_name}\""
fi

if [ ! -z "${PT_subscription_id+x}" ];
  then params="${params} subscription_id=\"${PT_subscription_id}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_public_ip_address_name+x}" ];
  then params="${params} public_ip_address_name=\"${PT_public_ip_address_name}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_append_tags+x}" ];
  then params="${params} append_tags=\"${PT_append_tags}\""
fi

if [ ! -z "${PT_ad_user+x}" ];
  then params="${params} ad_user=\"${PT_ad_user}\""
fi

if [ ! -z "${PT_secret+x}" ];
  then params="${params} secret=\"${PT_secret}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_subnet_name+x}" ];
  then params="${params} subnet_name=\"${PT_subnet_name}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_private_ip_allocation_method+x}" ];
  then params="${params} private_ip_allocation_method=\"${PT_private_ip_allocation_method}\""
fi

if [ ! -z "${PT_os_type+x}" ];
  then params="${params} os_type=\"${PT_os_type}\""
fi

ansible localhost -m azure_rm_networkinterface --args "${params}" --one-line | cut -f2- -d">"