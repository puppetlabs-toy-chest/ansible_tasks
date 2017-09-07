#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_resource_group+x}" ];
  then params="${params} resource_group=\"${PT_resource_group}\""
fi

if [ ! -z "${PT_public_ip_allocation_method+x}" ];
  then params="${params} public_ip_allocation_method=\"${PT_public_ip_allocation_method}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_ssh_public_keys+x}" ];
  then params="${params} ssh_public_keys=\"${PT_ssh_public_keys}\""
fi

if [ ! -z "${PT_storage_container_name+x}" ];
  then params="${params} storage_container_name=\"${PT_storage_container_name}\""
fi

if [ ! -z "${PT_allocated+x}" ];
  then params="${params} allocated=\"${PT_allocated}\""
fi

if [ ! -z "${PT_ssh_password_enabled+x}" ];
  then params="${params} ssh_password_enabled=\"${PT_ssh_password_enabled}\""
fi

if [ ! -z "${PT_vm_size+x}" ];
  then params="${params} vm_size=\"${PT_vm_size}\""
fi

if [ ! -z "${PT_remove_on_absent+x}" ];
  then params="${params} remove_on_absent=\"${PT_remove_on_absent}\""
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

if [ ! -z "${PT_short_hostname+x}" ];
  then params="${params} short_hostname=\"${PT_short_hostname}\""
fi

if [ ! -z "${PT_virtual_network_name+x}" ];
  then params="${params} virtual_network_name=\"${PT_virtual_network_name}\""
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

if [ ! -z "${PT_network_interface_names+x}" ];
  then params="${params} network_interface_names=\"${PT_network_interface_names}\""
fi

if [ ! -z "${PT_subscription_id+x}" ];
  then params="${params} subscription_id=\"${PT_subscription_id}\""
fi

if [ ! -z "${PT_admin_password+x}" ];
  then params="${params} admin_password=\"${PT_admin_password}\""
fi

if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_started+x}" ];
  then params="${params} started=\"${PT_started}\""
fi

if [ ! -z "${PT_open_ports+x}" ];
  then params="${params} open_ports=\"${PT_open_ports}\""
fi

if [ ! -z "${PT_client_id+x}" ];
  then params="${params} client_id=\"${PT_client_id}\""
fi

if [ ! -z "${PT_storage_blob_name+x}" ];
  then params="${params} storage_blob_name=\"${PT_storage_blob_name}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_restarted+x}" ];
  then params="${params} restarted=\"${PT_restarted}\""
fi

if [ ! -z "${PT_admin_username+x}" ];
  then params="${params} admin_username=\"${PT_admin_username}\""
fi

if [ ! -z "${PT_os_type+x}" ];
  then params="${params} os_type=\"${PT_os_type}\""
fi

if [ ! -z "${PT_storage_account_name+x}" ];
  then params="${params} storage_account_name=\"${PT_storage_account_name}\""
fi

if [ ! -z "${PT_os_disk_caching+x}" ];
  then params="${params} os_disk_caching=\"${PT_os_disk_caching}\""
fi

ansible localhost -m azure_rm_virtualmachine --args "${params}" --one-line | cut -f2- -d">"