#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_disks+x}" ];
  then params="${params} disks=\"${PT_disks}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_dedicated+x}" ];
  then params="${params} dedicated=\"${PT_dedicated}\""
fi

if [ ! -z "${PT_private+x}" ];
  then params="${params} private=\"${PT_private}\""
fi

if [ ! -z "${PT_cpus+x}" ];
  then params="${params} cpus=\"${PT_cpus}\""
fi

if [ ! -z "${PT_image_id+x}" ];
  then params="${params} image_id=\"${PT_image_id}\""
fi

if [ ! -z "${PT_nic_speed+x}" ];
  then params="${params} nic_speed=\"${PT_nic_speed}\""
fi

if [ ! -z "${PT_private_vlan+x}" ];
  then params="${params} private_vlan=\"${PT_private_vlan}\""
fi

if [ ! -z "${PT_datacenter+x}" ];
  then params="${params} datacenter=\"${PT_datacenter}\""
fi

if [ ! -z "${PT_public_vlan+x}" ];
  then params="${params} public_vlan=\"${PT_public_vlan}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_hourly+x}" ];
  then params="${params} hourly=\"${PT_hourly}\""
fi

if [ ! -z "${PT_ssh_keys+x}" ];
  then params="${params} ssh_keys=\"${PT_ssh_keys}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_os_code+x}" ];
  then params="${params} os_code=\"${PT_os_code}\""
fi

if [ ! -z "${PT_instance_id+x}" ];
  then params="${params} instance_id=\"${PT_instance_id}\""
fi

if [ ! -z "${PT_local_disk+x}" ];
  then params="${params} local_disk=\"${PT_local_disk}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_post_uri+x}" ];
  then params="${params} post_uri=\"${PT_post_uri}\""
fi

if [ ! -z "${PT_memory+x}" ];
  then params="${params} memory=\"${PT_memory}\""
fi

ansible localhost -m sl_vm --args "${params}" --one-line | cut -f2- -d">"