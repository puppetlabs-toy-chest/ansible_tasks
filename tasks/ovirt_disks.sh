#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_vm_name+x}" ];
  then params="${params} vm_name=\"${PT_vm_name}\""
fi

if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_storage_domains+x}" ];
  then params="${params} storage_domains=\"${PT_storage_domains}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_format+x}" ];
  then params="${params} format=\"${PT_format}\""
fi

if [ ! -z "${PT_upload_image_path+x}" ];
  then params="${params} upload_image_path=\"${PT_upload_image_path}\""
fi

if [ ! -z "${PT_logical_unit+x}" ];
  then params="${params} logical_unit=\"${PT_logical_unit}\""
fi

if [ ! -z "${PT_nested_attributes+x}" ];
  then params="${params} nested_attributes=\"${PT_nested_attributes}\""
fi

if [ ! -z "${PT_fetch_nested+x}" ];
  then params="${params} fetch_nested=\"${PT_fetch_nested}\""
fi

if [ ! -z "${PT_download_image_path+x}" ];
  then params="${params} download_image_path=\"${PT_download_image_path}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_vm_id+x}" ];
  then params="${params} vm_id=\"${PT_vm_id}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_storage_domain+x}" ];
  then params="${params} storage_domain=\"${PT_storage_domain}\""
fi

if [ ! -z "${PT_openstack_volume_type+x}" ];
  then params="${params} openstack_volume_type=\"${PT_openstack_volume_type}\""
fi

if [ ! -z "${PT_bootable+x}" ];
  then params="${params} bootable=\"${PT_bootable}\""
fi

if [ ! -z "${PT_sparsify+x}" ];
  then params="${params} sparsify=\"${PT_sparsify}\""
fi

if [ ! -z "${PT_poll_interval+x}" ];
  then params="${params} poll_interval=\"${PT_poll_interval}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_shareable+x}" ];
  then params="${params} shareable=\"${PT_shareable}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_size+x}" ];
  then params="${params} size=\"${PT_size}\""
fi

ansible localhost -m ovirt_disks --args "${params}" --one-line | cut -f2- -d">"