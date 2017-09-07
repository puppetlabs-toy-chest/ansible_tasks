#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_customer_metadata+x}" ];
  then params="${params} customer_metadata=\"${PT_customer_metadata}\""
fi

if [ ! -z "${PT_disk_driver+x}" ];
  then params="${params} disk_driver=\"${PT_disk_driver}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_zfs_root_compression+x}" ];
  then params="${params} zfs_root_compression=\"${PT_zfs_root_compression}\""
fi

if [ ! -z "${PT_virtio_txtimer+x}" ];
  then params="${params} virtio_txtimer=\"${PT_virtio_txtimer}\""
fi

if [ ! -z "${PT_spice_password+x}" ];
  then params="${params} spice_password=\"${PT_spice_password}\""
fi

if [ ! -z "${PT_zfs_io_priority+x}" ];
  then params="${params} zfs_io_priority=\"${PT_zfs_io_priority}\""
fi

if [ ! -z "${PT_ram+x}" ];
  then params="${params} ram=\"${PT_ram}\""
fi

if [ ! -z "${PT_dns_domain+x}" ];
  then params="${params} dns_domain=\"${PT_dns_domain}\""
fi

if [ ! -z "${PT_max_physical_memory+x}" ];
  then params="${params} max_physical_memory=\"${PT_max_physical_memory}\""
fi

if [ ! -z "${PT_nic_driver+x}" ];
  then params="${params} nic_driver=\"${PT_nic_driver}\""
fi

if [ ! -z "${PT_zfs_data_compression+x}" ];
  then params="${params} zfs_data_compression=\"${PT_zfs_data_compression}\""
fi

if [ ! -z "${PT_image_uuid+x}" ];
  then params="${params} image_uuid=\"${PT_image_uuid}\""
fi

if [ ! -z "${PT_fs_allowed+x}" ];
  then params="${params} fs_allowed=\"${PT_fs_allowed}\""
fi

if [ ! -z "${PT_indestructible_delegated+x}" ];
  then params="${params} indestructible_delegated=\"${PT_indestructible_delegated}\""
fi

if [ ! -z "${PT_qemu_opts+x}" ];
  then params="${params} qemu_opts=\"${PT_qemu_opts}\""
fi

if [ ! -z "${PT_delegate_dataset+x}" ];
  then params="${params} delegate_dataset=\"${PT_delegate_dataset}\""
fi

if [ ! -z "${PT_firewall_enabled+x}" ];
  then params="${params} firewall_enabled=\"${PT_firewall_enabled}\""
fi

if [ ! -z "${PT_mdata_exec_timeout+x}" ];
  then params="${params} mdata_exec_timeout=\"${PT_mdata_exec_timeout}\""
fi

if [ ! -z "${PT_archive_on_delete+x}" ];
  then params="${params} archive_on_delete=\"${PT_archive_on_delete}\""
fi

if [ ! -z "${PT_nics+x}" ];
  then params="${params} nics=\"${PT_nics}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_boot+x}" ];
  then params="${params} boot=\"${PT_boot}\""
fi

if [ ! -z "${PT_vga+x}" ];
  then params="${params} vga=\"${PT_vga}\""
fi

if [ ! -z "${PT_zfs_snapshot_limit+x}" ];
  then params="${params} zfs_snapshot_limit=\"${PT_zfs_snapshot_limit}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_limit_priv+x}" ];
  then params="${params} limit_priv=\"${PT_limit_priv}\""
fi

if [ ! -z "${PT_cpu_cap+x}" ];
  then params="${params} cpu_cap=\"${PT_cpu_cap}\""
fi

if [ ! -z "${PT_maintain_resolvers+x}" ];
  then params="${params} maintain_resolvers=\"${PT_maintain_resolvers}\""
fi

if [ ! -z "${PT_indestructible_zoneroot+x}" ];
  then params="${params} indestructible_zoneroot=\"${PT_indestructible_zoneroot}\""
fi

if [ ! -z "${PT_vnc_password+x}" ];
  then params="${params} vnc_password=\"${PT_vnc_password}\""
fi

if [ ! -z "${PT_vcpus+x}" ];
  then params="${params} vcpus=\"${PT_vcpus}\""
fi

if [ ! -z "${PT_disks+x}" ];
  then params="${params} disks=\"${PT_disks}\""
fi

if [ ! -z "${PT_max_swap+x}" ];
  then params="${params} max_swap=\"${PT_max_swap}\""
fi

if [ ! -z "${PT_zfs_root_recsize+x}" ];
  then params="${params} zfs_root_recsize=\"${PT_zfs_root_recsize}\""
fi

if [ ! -z "${PT_brand+x}" ];
  then params="${params} brand=\"${PT_brand}\""
fi

if [ ! -z "${PT_zfs_filesystem_limit+x}" ];
  then params="${params} zfs_filesystem_limit=\"${PT_zfs_filesystem_limit}\""
fi

if [ ! -z "${PT_quota+x}" ];
  then params="${params} quota=\"${PT_quota}\""
fi

if [ ! -z "${PT_filesystems+x}" ];
  then params="${params} filesystems=\"${PT_filesystems}\""
fi

if [ ! -z "${PT_autoboot+x}" ];
  then params="${params} autoboot=\"${PT_autoboot}\""
fi

if [ ! -z "${PT_tmpfs+x}" ];
  then params="${params} tmpfs=\"${PT_tmpfs}\""
fi

if [ ! -z "${PT_qemu_extra_opts+x}" ];
  then params="${params} qemu_extra_opts=\"${PT_qemu_extra_opts}\""
fi

if [ ! -z "${PT_resolvers+x}" ];
  then params="${params} resolvers=\"${PT_resolvers}\""
fi

if [ ! -z "${PT_max_lwps+x}" ];
  then params="${params} max_lwps=\"${PT_max_lwps}\""
fi

if [ ! -z "${PT_nowait+x}" ];
  then params="${params} nowait=\"${PT_nowait}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_kernel_version+x}" ];
  then params="${params} kernel_version=\"${PT_kernel_version}\""
fi

if [ ! -z "${PT_max_locked_memory+x}" ];
  then params="${params} max_locked_memory=\"${PT_max_locked_memory}\""
fi

if [ ! -z "${PT_vnc_port+x}" ];
  then params="${params} vnc_port=\"${PT_vnc_port}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_internal_metadata_namespace+x}" ];
  then params="${params} internal_metadata_namespace=\"${PT_internal_metadata_namespace}\""
fi

if [ ! -z "${PT_virtio_txburst+x}" ];
  then params="${params} virtio_txburst=\"${PT_virtio_txburst}\""
fi

if [ ! -z "${PT_spice_opts+x}" ];
  then params="${params} spice_opts=\"${PT_spice_opts}\""
fi

if [ ! -z "${PT_zfs_data_recsize+x}" ];
  then params="${params} zfs_data_recsize=\"${PT_zfs_data_recsize}\""
fi

if [ ! -z "${PT_internal_metadata+x}" ];
  then params="${params} internal_metadata=\"${PT_internal_metadata}\""
fi

if [ ! -z "${PT_cpu_type+x}" ];
  then params="${params} cpu_type=\"${PT_cpu_type}\""
fi

if [ ! -z "${PT_routes+x}" ];
  then params="${params} routes=\"${PT_routes}\""
fi

if [ ! -z "${PT_zpool+x}" ];
  then params="${params} zpool=\"${PT_zpool}\""
fi

if [ ! -z "${PT_cpu_shares+x}" ];
  then params="${params} cpu_shares=\"${PT_cpu_shares}\""
fi

ansible localhost -m vmadm --args "${params}" --one-line | cut -f2- -d">"