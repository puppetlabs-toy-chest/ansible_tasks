#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_memory_guaranteed+x}" ];
  then params="${params} memory_guaranteed=\"${PT_memory_guaranteed}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_cloud_init_nics+x}" ];
  then params="${params} cloud_init_nics=\"${PT_cloud_init_nics}\""
fi

if [ ! -z "${PT_xen+x}" ];
  then params="${params} xen=\"${PT_xen}\""
fi

if [ ! -z "${PT_template_version+x}" ];
  then params="${params} template_version=\"${PT_template_version}\""
fi

if [ ! -z "${PT_cluster+x}" ];
  then params="${params} cluster=\"${PT_cluster}\""
fi

if [ ! -z "${PT_fetch_nested+x}" ];
  then params="${params} fetch_nested=\"${PT_fetch_nested}\""
fi

if [ ! -z "${PT_timezone+x}" ];
  then params="${params} timezone=\"${PT_timezone}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
fi

if [ ! -z "${PT_cpu_sockets+x}" ];
  then params="${params} cpu_sockets=\"${PT_cpu_sockets}\""
fi

if [ ! -z "${PT_high_availability+x}" ];
  then params="${params} high_availability=\"${PT_high_availability}\""
fi

if [ ! -z "${PT_storage_domain+x}" ];
  then params="${params} storage_domain=\"${PT_storage_domain}\""
fi

if [ ! -z "${PT_instance_type+x}" ];
  then params="${params} instance_type=\"${PT_instance_type}\""
fi

if [ ! -z "${PT_nics+x}" ];
  then params="${params} nics=\"${PT_nics}\""
fi

if [ ! -z "${PT_disk_format+x}" ];
  then params="${params} disk_format=\"${PT_disk_format}\""
fi

if [ ! -z "${PT_sysprep+x}" ];
  then params="${params} sysprep=\"${PT_sysprep}\""
fi

if [ ! -z "${PT_cpu_cores+x}" ];
  then params="${params} cpu_cores=\"${PT_cpu_cores}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_vmware+x}" ];
  then params="${params} vmware=\"${PT_vmware}\""
fi

if [ ! -z "${PT_delete_protected+x}" ];
  then params="${params} delete_protected=\"${PT_delete_protected}\""
fi

if [ ! -z "${PT_memory+x}" ];
  then params="${params} memory=\"${PT_memory}\""
fi

if [ ! -z "${PT_cd_iso+x}" ];
  then params="${params} cd_iso=\"${PT_cd_iso}\""
fi

if [ ! -z "${PT_clone_permissions+x}" ];
  then params="${params} clone_permissions=\"${PT_clone_permissions}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_initrd_path+x}" ];
  then params="${params} initrd_path=\"${PT_initrd_path}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_clone+x}" ];
  then params="${params} clone=\"${PT_clone}\""
fi

if [ ! -z "${PT_kvm+x}" ];
  then params="${params} kvm=\"${PT_kvm}\""
fi

if [ ! -z "${PT_boot_devices+x}" ];
  then params="${params} boot_devices=\"${PT_boot_devices}\""
fi

if [ ! -z "${PT_nested_attributes+x}" ];
  then params="${params} nested_attributes=\"${PT_nested_attributes}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_serial_policy+x}" ];
  then params="${params} serial_policy=\"${PT_serial_policy}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_use_latest_template_version+x}" ];
  then params="${params} use_latest_template_version=\"${PT_use_latest_template_version}\""
fi

if [ ! -z "${PT_stateless+x}" ];
  then params="${params} stateless=\"${PT_stateless}\""
fi

if [ ! -z "${PT_operating_system+x}" ];
  then params="${params} operating_system=\"${PT_operating_system}\""
fi

if [ ! -z "${PT_serial_policy_value+x}" ];
  then params="${params} serial_policy_value=\"${PT_serial_policy_value}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_kernel_path+x}" ];
  then params="${params} kernel_path=\"${PT_kernel_path}\""
fi

if [ ! -z "${PT_cloud_init+x}" ];
  then params="${params} cloud_init=\"${PT_cloud_init}\""
fi

if [ ! -z "${PT_disks+x}" ];
  then params="${params} disks=\"${PT_disks}\""
fi

if [ ! -z "${PT_poll_interval+x}" ];
  then params="${params} poll_interval=\"${PT_poll_interval}\""
fi

if [ ! -z "${PT_kernel_params+x}" ];
  then params="${params} kernel_params=\"${PT_kernel_params}\""
fi

if [ ! -z "${PT_template+x}" ];
  then params="${params} template=\"${PT_template}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_cpu_shares+x}" ];
  then params="${params} cpu_shares=\"${PT_cpu_shares}\""
fi

ansible localhost -m ovirt_vms --args "${params}" --one-line | cut -f2- -d">"