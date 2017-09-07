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

if [ ! -z "${PT_snapshot_src+x}" ];
  then params="${params} snapshot_src=\"${PT_snapshot_src}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_template+x}" ];
  then params="${params} template=\"${PT_template}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_hardware+x}" ];
  then params="${params} hardware=\"${PT_hardware}\""
fi

if [ ! -z "${PT_cluster+x}" ];
  then params="${params} cluster=\"${PT_cluster}\""
fi

if [ ! -z "${PT_name_match+x}" ];
  then params="${params} name_match=\"${PT_name_match}\""
fi

if [ ! -z "${PT_customization+x}" ];
  then params="${params} customization=\"${PT_customization}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_networks+x}" ];
  then params="${params} networks=\"${PT_networks}\""
fi

if [ ! -z "${PT_wait_for_ip_address+x}" ];
  then params="${params} wait_for_ip_address=\"${PT_wait_for_ip_address}\""
fi

if [ ! -z "${PT_datacenter+x}" ];
  then params="${params} datacenter=\"${PT_datacenter}\""
fi

if [ ! -z "${PT_disk+x}" ];
  then params="${params} disk=\"${PT_disk}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_customvalues+x}" ];
  then params="${params} customvalues=\"${PT_customvalues}\""
fi

if [ ! -z "${PT_guest_id+x}" ];
  then params="${params} guest_id=\"${PT_guest_id}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_annotation+x}" ];
  then params="${params} annotation=\"${PT_annotation}\""
fi

if [ ! -z "${PT_is_template+x}" ];
  then params="${params} is_template=\"${PT_is_template}\""
fi

if [ ! -z "${PT_esxi_hostname+x}" ];
  then params="${params} esxi_hostname=\"${PT_esxi_hostname}\""
fi

if [ ! -z "${PT_linked_clone+x}" ];
  then params="${params} linked_clone=\"${PT_linked_clone}\""
fi

if [ ! -z "${PT_folder+x}" ];
  then params="${params} folder=\"${PT_folder}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m vmware_guest --args "${params}" --one-line | cut -f2- -d">"