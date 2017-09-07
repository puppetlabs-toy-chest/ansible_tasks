#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_lan+x}" ];
  then params="${params} lan=\"${PT_lan}\""
fi

if [ ! -z "${PT_image_password+x}" ];
  then params="${params} image_password=\"${PT_image_password}\""
fi

if [ ! -z "${PT_bus+x}" ];
  then params="${params} bus=\"${PT_bus}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_ram+x}" ];
  then params="${params} ram=\"${PT_ram}\""
fi

if [ ! -z "${PT_instance_ids+x}" ];
  then params="${params} instance_ids=\"${PT_instance_ids}\""
fi

if [ ! -z "${PT_subscription_password+x}" ];
  then params="${params} subscription_password=\"${PT_subscription_password}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_assign_public_ip+x}" ];
  then params="${params} assign_public_ip=\"${PT_assign_public_ip}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_count+x}" ];
  then params="${params} count=\"${PT_count}\""
fi

if [ ! -z "${PT_datacenter+x}" ];
  then params="${params} datacenter=\"${PT_datacenter}\""
fi

if [ ! -z "${PT_remove_boot_volume+x}" ];
  then params="${params} remove_boot_volume=\"${PT_remove_boot_volume}\""
fi

if [ ! -z "${PT_ssh_keys+x}" ];
  then params="${params} ssh_keys=\"${PT_ssh_keys}\""
fi

if [ ! -z "${PT_subscription_user+x}" ];
  then params="${params} subscription_user=\"${PT_subscription_user}\""
fi

if [ ! -z "${PT_cpu_family+x}" ];
  then params="${params} cpu_family=\"${PT_cpu_family}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_volume_size+x}" ];
  then params="${params} volume_size=\"${PT_volume_size}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_auto_increment+x}" ];
  then params="${params} auto_increment=\"${PT_auto_increment}\""
fi

if [ ! -z "${PT_cores+x}" ];
  then params="${params} cores=\"${PT_cores}\""
fi

ansible localhost -m profitbricks --args "${params}" --one-line | cut -f2- -d">"