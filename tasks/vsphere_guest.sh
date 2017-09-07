#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_resource_pool+x}" ];
  then params="${params} resource_pool=\"${PT_resource_pool}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_vm_disk+x}" ];
  then params="${params} vm_disk=\"${PT_vm_disk}\""
fi

if [ ! -z "${PT_vm_hw_version+x}" ];
  then params="${params} vm_hw_version=\"${PT_vm_hw_version}\""
fi

if [ ! -z "${PT_cluster+x}" ];
  then params="${params} cluster=\"${PT_cluster}\""
fi

if [ ! -z "${PT_vmware_guest_facts+x}" ];
  then params="${params} vmware_guest_facts=\"${PT_vmware_guest_facts}\""
fi

if [ ! -z "${PT_vm_extra_config+x}" ];
  then params="${params} vm_extra_config=\"${PT_vm_extra_config}\""
fi

if [ ! -z "${PT_vcenter_hostname+x}" ];
  then params="${params} vcenter_hostname=\"${PT_vcenter_hostname}\""
fi

if [ ! -z "${PT_template_src+x}" ];
  then params="${params} template_src=\"${PT_template_src}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_power_on_after_clone+x}" ];
  then params="${params} power_on_after_clone=\"${PT_power_on_after_clone}\""
fi

if [ ! -z "${PT_guest+x}" ];
  then params="${params} guest=\"${PT_guest}\""
fi

if [ ! -z "${PT_vm_nic+x}" ];
  then params="${params} vm_nic=\"${PT_vm_nic}\""
fi

if [ ! -z "${PT_esxi+x}" ];
  then params="${params} esxi=\"${PT_esxi}\""
fi

if [ ! -z "${PT_vm_hardware+x}" ];
  then params="${params} vm_hardware=\"${PT_vm_hardware}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_from_template+x}" ];
  then params="${params} from_template=\"${PT_from_template}\""
fi

if [ ! -z "${PT_snapshot_to_clone+x}" ];
  then params="${params} snapshot_to_clone=\"${PT_snapshot_to_clone}\""
fi

ansible localhost -m vsphere_guest --args "${params}" --one-line | cut -f2- -d">"