#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_revert+x}" ];
  then params="${params} revert=\"${PT_revert}\""
fi

if [ ! -z "${PT_boot+x}" ];
  then params="${params} boot=\"${PT_boot}\""
fi

if [ ! -z "${PT_migrate_speed+x}" ];
  then params="${params} migrate_speed=\"${PT_migrate_speed}\""
fi

if [ ! -z "${PT_vga+x}" ];
  then params="${params} vga=\"${PT_vga}\""
fi

if [ ! -z "${PT_keyboard+x}" ];
  then params="${params} keyboard=\"${PT_keyboard}\""
fi

if [ ! -z "${PT_watchdog+x}" ];
  then params="${params} watchdog=\"${PT_watchdog}\""
fi

if [ ! -z "${PT_sockets+x}" ];
  then params="${params} sockets=\"${PT_sockets}\""
fi

if [ ! -z "${PT_digest+x}" ];
  then params="${params} digest=\"${PT_digest}\""
fi

if [ ! -z "${PT_tablet+x}" ];
  then params="${params} tablet=\"${PT_tablet}\""
fi

if [ ! -z "${PT_bios+x}" ];
  then params="${params} bios=\"${PT_bios}\""
fi

if [ ! -z "${PT_hostpci+x}" ];
  then params="${params} hostpci=\"${PT_hostpci}\""
fi

if [ ! -z "${PT_autostart+x}" ];
  then params="${params} autostart=\"${PT_autostart}\""
fi

if [ ! -z "${PT_memory+x}" ];
  then params="${params} memory=\"${PT_memory}\""
fi

if [ ! -z "${PT_migrate_downtime+x}" ];
  then params="${params} migrate_downtime=\"${PT_migrate_downtime}\""
fi

if [ ! -z "${PT_localtime+x}" ];
  then params="${params} localtime=\"${PT_localtime}\""
fi

if [ ! -z "${PT_virtio+x}" ];
  then params="${params} virtio=\"${PT_virtio}\""
fi

if [ ! -z "${PT_format+x}" ];
  then params="${params} format=\"${PT_format}\""
fi

if [ ! -z "${PT_snapname+x}" ];
  then params="${params} snapname=\"${PT_snapname}\""
fi

if [ ! -z "${PT_hotplug+x}" ];
  then params="${params} hotplug=\"${PT_hotplug}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_target+x}" ];
  then params="${params} target=\"${PT_target}\""
fi

if [ ! -z "${PT_vmid+x}" ];
  then params="${params} vmid=\"${PT_vmid}\""
fi

if [ ! -z "${PT_bootdisk+x}" ];
  then params="${params} bootdisk=\"${PT_bootdisk}\""
fi

if [ ! -z "${PT_vcpus+x}" ];
  then params="${params} vcpus=\"${PT_vcpus}\""
fi

if [ ! -z "${PT_newid+x}" ];
  then params="${params} newid=\"${PT_newid}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_skiplock+x}" ];
  then params="${params} skiplock=\"${PT_skiplock}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_onboot+x}" ];
  then params="${params} onboot=\"${PT_onboot}\""
fi

if [ ! -z "${PT_delete+x}" ];
  then params="${params} delete=\"${PT_delete}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_lock+x}" ];
  then params="${params} lock=\"${PT_lock}\""
fi

if [ ! -z "${PT_startup+x}" ];
  then params="${params} startup=\"${PT_startup}\""
fi

if [ ! -z "${PT_agent+x}" ];
  then params="${params} agent=\"${PT_agent}\""
fi

if [ ! -z "${PT_freeze+x}" ];
  then params="${params} freeze=\"${PT_freeze}\""
fi

if [ ! -z "${PT_serial+x}" ];
  then params="${params} serial=\"${PT_serial}\""
fi

if [ ! -z "${PT_startdate+x}" ];
  then params="${params} startdate=\"${PT_startdate}\""
fi

if [ ! -z "${PT_balloon+x}" ];
  then params="${params} balloon=\"${PT_balloon}\""
fi

if [ ! -z "${PT_cpuunits+x}" ];
  then params="${params} cpuunits=\"${PT_cpuunits}\""
fi

if [ ! -z "${PT_storage+x}" ];
  then params="${params} storage=\"${PT_storage}\""
fi

if [ ! -z "${PT_reboot+x}" ];
  then params="${params} reboot=\"${PT_reboot}\""
fi

if [ ! -z "${PT_shares+x}" ];
  then params="${params} shares=\"${PT_shares}\""
fi

if [ ! -z "${PT_machine+x}" ];
  then params="${params} machine=\"${PT_machine}\""
fi

if [ ! -z "${PT_sata+x}" ];
  then params="${params} sata=\"${PT_sata}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_template+x}" ];
  then params="${params} template=\"${PT_template}\""
fi

if [ ! -z "${PT_net+x}" ];
  then params="${params} net=\"${PT_net}\""
fi

if [ ! -z "${PT_acpi+x}" ];
  then params="${params} acpi=\"${PT_acpi}\""
fi

if [ ! -z "${PT_node+x}" ];
  then params="${params} node=\"${PT_node}\""
fi

if [ ! -z "${PT_full+x}" ];
  then params="${params} full=\"${PT_full}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_scsihw+x}" ];
  then params="${params} scsihw=\"${PT_scsihw}\""
fi

if [ ! -z "${PT_clone+x}" ];
  then params="${params} clone=\"${PT_clone}\""
fi

if [ ! -z "${PT_args+x}" ];
  then params="${params} args=\"${PT_args}\""
fi

if [ ! -z "${PT_api_password+x}" ];
  then params="${params} api_password=\"${PT_api_password}\""
fi

if [ ! -z "${PT_tdf+x}" ];
  then params="${params} tdf=\"${PT_tdf}\""
fi

if [ ! -z "${PT_update+x}" ];
  then params="${params} update=\"${PT_update}\""
fi

if [ ! -z "${PT_kvm+x}" ];
  then params="${params} kvm=\"${PT_kvm}\""
fi

if [ ! -z "${PT_ostype+x}" ];
  then params="${params} ostype=\"${PT_ostype}\""
fi

if [ ! -z "${PT_protection+x}" ];
  then params="${params} protection=\"${PT_protection}\""
fi

if [ ! -z "${PT_numa+x}" ];
  then params="${params} numa=\"${PT_numa}\""
fi

if [ ! -z "${PT_parallel+x}" ];
  then params="${params} parallel=\"${PT_parallel}\""
fi

if [ ! -z "${PT_pool+x}" ];
  then params="${params} pool=\"${PT_pool}\""
fi

if [ ! -z "${PT_api_host+x}" ];
  then params="${params} api_host=\"${PT_api_host}\""
fi

if [ ! -z "${PT_cpulimit+x}" ];
  then params="${params} cpulimit=\"${PT_cpulimit}\""
fi

if [ ! -z "${PT_api_user+x}" ];
  then params="${params} api_user=\"${PT_api_user}\""
fi

if [ ! -z "${PT_hugepages+x}" ];
  then params="${params} hugepages=\"${PT_hugepages}\""
fi

if [ ! -z "${PT_smbios+x}" ];
  then params="${params} smbios=\"${PT_smbios}\""
fi

if [ ! -z "${PT_cores+x}" ];
  then params="${params} cores=\"${PT_cores}\""
fi

if [ ! -z "${PT_scsi+x}" ];
  then params="${params} scsi=\"${PT_scsi}\""
fi

if [ ! -z "${PT_ide+x}" ];
  then params="${params} ide=\"${PT_ide}\""
fi

if [ ! -z "${PT_cpu+x}" ];
  then params="${params} cpu=\"${PT_cpu}\""
fi

ansible localhost -m proxmox_kvm --args "${params}" --one-line | cut -f2- -d">"