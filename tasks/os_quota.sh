#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_auth_type+x}" ];
  then params="${params} auth_type=\"${PT_auth_type}\""
fi

if [ ! -z "${PT_snapshots_lvm+x}" ];
  then params="${params} snapshots_lvm=\"${PT_snapshots_lvm}\""
fi

if [ ! -z "${PT_server_group_members+x}" ];
  then params="${params} server_group_members=\"${PT_server_group_members}\""
fi

if [ ! -z "${PT_server_groups+x}" ];
  then params="${params} server_groups=\"${PT_server_groups}\""
fi

if [ ! -z "${PT_ram+x}" ];
  then params="${params} ram=\"${PT_ram}\""
fi

if [ ! -z "${PT_snapshots+x}" ];
  then params="${params} snapshots=\"${PT_snapshots}\""
fi

if [ ! -z "${PT_instances+x}" ];
  then params="${params} instances=\"${PT_instances}\""
fi

if [ ! -z "${PT_backups+x}" ];
  then params="${params} backups=\"${PT_backups}\""
fi

if [ ! -z "${PT_fixed_ips+x}" ];
  then params="${params} fixed_ips=\"${PT_fixed_ips}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_cloud+x}" ];
  then params="${params} cloud=\"${PT_cloud}\""
fi

if [ ! -z "${PT_subnet+x}" ];
  then params="${params} subnet=\"${PT_subnet}\""
fi

if [ ! -z "${PT_per_volume_gigabytes+x}" ];
  then params="${params} per_volume_gigabytes=\"${PT_per_volume_gigabytes}\""
fi

if [ ! -z "${PT_network+x}" ];
  then params="${params} network=\"${PT_network}\""
fi

if [ ! -z "${PT_floatingip+x}" ];
  then params="${params} floatingip=\"${PT_floatingip}\""
fi

if [ ! -z "${PT_availability_zone+x}" ];
  then params="${params} availability_zone=\"${PT_availability_zone}\""
fi

if [ ! -z "${PT_volumes_lvm+x}" ];
  then params="${params} volumes_lvm=\"${PT_volumes_lvm}\""
fi

if [ ! -z "${PT_floating_ips+x}" ];
  then params="${params} floating_ips=\"${PT_floating_ips}\""
fi

if [ ! -z "${PT_security_group_rule+x}" ];
  then params="${params} security_group_rule=\"${PT_security_group_rule}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_injected_files+x}" ];
  then params="${params} injected_files=\"${PT_injected_files}\""
fi

if [ ! -z "${PT_rbac_policy+x}" ];
  then params="${params} rbac_policy=\"${PT_rbac_policy}\""
fi

if [ ! -z "${PT_subnetpool+x}" ];
  then params="${params} subnetpool=\"${PT_subnetpool}\""
fi

if [ ! -z "${PT_injected_path_size+x}" ];
  then params="${params} injected_path_size=\"${PT_injected_path_size}\""
fi

if [ ! -z "${PT_region_name+x}" ];
  then params="${params} region_name=\"${PT_region_name}\""
fi

if [ ! -z "${PT_gigabytes+x}" ];
  then params="${params} gigabytes=\"${PT_gigabytes}\""
fi

if [ ! -z "${PT_backup_gigabytes+x}" ];
  then params="${params} backup_gigabytes=\"${PT_backup_gigabytes}\""
fi

if [ ! -z "${PT_api_timeout+x}" ];
  then params="${params} api_timeout=\"${PT_api_timeout}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_endpoint_type+x}" ];
  then params="${params} endpoint_type=\"${PT_endpoint_type}\""
fi

if [ ! -z "${PT_key_pairs+x}" ];
  then params="${params} key_pairs=\"${PT_key_pairs}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_cores+x}" ];
  then params="${params} cores=\"${PT_cores}\""
fi

if [ ! -z "${PT_cacert+x}" ];
  then params="${params} cacert=\"${PT_cacert}\""
fi

if [ ! -z "${PT_volumes+x}" ];
  then params="${params} volumes=\"${PT_volumes}\""
fi

if [ ! -z "${PT_properties+x}" ];
  then params="${params} properties=\"${PT_properties}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_cert+x}" ];
  then params="${params} cert=\"${PT_cert}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_gigabytes_lvm+x}" ];
  then params="${params} gigabytes_lvm=\"${PT_gigabytes_lvm}\""
fi

if [ ! -z "${PT_security_group+x}" ];
  then params="${params} security_group=\"${PT_security_group}\""
fi

if [ ! -z "${PT_router+x}" ];
  then params="${params} router=\"${PT_router}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_injected_file_size+x}" ];
  then params="${params} injected_file_size=\"${PT_injected_file_size}\""
fi

ansible localhost -m os_quota --args "${params}" --one-line | cut -f2- -d">"