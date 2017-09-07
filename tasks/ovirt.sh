#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_instance_mem+x}" ];
  then params="${params} instance_mem=\"${PT_instance_mem}\""
fi

if [ ! -z "${PT_instance_cores+x}" ];
  then params="${params} instance_cores=\"${PT_instance_cores}\""
fi

if [ ! -z "${PT_instance_cpus+x}" ];
  then params="${params} instance_cpus=\"${PT_instance_cpus}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_instance_hostname+x}" ];
  then params="${params} instance_hostname=\"${PT_instance_hostname}\""
fi

if [ ! -z "${PT_instance_disksize+x}" ];
  then params="${params} instance_disksize=\"${PT_instance_disksize}\""
fi

if [ ! -z "${PT_instance_nic+x}" ];
  then params="${params} instance_nic=\"${PT_instance_nic}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_instance_network+x}" ];
  then params="${params} instance_network=\"${PT_instance_network}\""
fi

if [ ! -z "${PT_instance_type+x}" ];
  then params="${params} instance_type=\"${PT_instance_type}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_sdomain+x}" ];
  then params="${params} sdomain=\"${PT_sdomain}\""
fi

if [ ! -z "${PT_instance_os+x}" ];
  then params="${params} instance_os=\"${PT_instance_os}\""
fi

if [ ! -z "${PT_instance_ip+x}" ];
  then params="${params} instance_ip=\"${PT_instance_ip}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_disk_alloc+x}" ];
  then params="${params} disk_alloc=\"${PT_disk_alloc}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_instance_dns+x}" ];
  then params="${params} instance_dns=\"${PT_instance_dns}\""
fi

if [ ! -z "${PT_instance_name+x}" ];
  then params="${params} instance_name=\"${PT_instance_name}\""
fi

if [ ! -z "${PT_instance_netmask+x}" ];
  then params="${params} instance_netmask=\"${PT_instance_netmask}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_instance_key+x}" ];
  then params="${params} instance_key=\"${PT_instance_key}\""
fi

if [ ! -z "${PT_instance_domain+x}" ];
  then params="${params} instance_domain=\"${PT_instance_domain}\""
fi

if [ ! -z "${PT_instance_rootpw+x}" ];
  then params="${params} instance_rootpw=\"${PT_instance_rootpw}\""
fi

if [ ! -z "${PT_resource_type+x}" ];
  then params="${params} resource_type=\"${PT_resource_type}\""
fi

if [ ! -z "${PT_disk_int+x}" ];
  then params="${params} disk_int=\"${PT_disk_int}\""
fi

ansible localhost -m ovirt --args "${params}" --one-line | cut -f2- -d">"