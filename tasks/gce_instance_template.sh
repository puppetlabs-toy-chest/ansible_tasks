#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_automatic_restart+x}" ];
  then params="${params} automatic_restart=\"${PT_automatic_restart}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_service_account_permissions+x}" ];
  then params="${params} service_account_permissions=\"${PT_service_account_permissions}\""
fi

if [ ! -z "${PT_pem_file+x}" ];
  then params="${params} pem_file=\"${PT_pem_file}\""
fi

if [ ! -z "${PT_subnetwork_region+x}" ];
  then params="${params} subnetwork_region=\"${PT_subnetwork_region}\""
fi

if [ ! -z "${PT_disk_type+x}" ];
  then params="${params} disk_type=\"${PT_disk_type}\""
fi

if [ ! -z "${PT_size+x}" ];
  then params="${params} size=\"${PT_size}\""
fi

if [ ! -z "${PT_network+x}" ];
  then params="${params} network=\"${PT_network}\""
fi

if [ ! -z "${PT_external_ip+x}" ];
  then params="${params} external_ip=\"${PT_external_ip}\""
fi

if [ ! -z "${PT_service_account_email+x}" ];
  then params="${params} service_account_email=\"${PT_service_account_email}\""
fi

if [ ! -z "${PT_disks+x}" ];
  then params="${params} disks=\"${PT_disks}\""
fi

if [ ! -z "${PT_nic_gce_struct+x}" ];
  then params="${params} nic_gce_struct=\"${PT_nic_gce_struct}\""
fi

if [ ! -z "${PT_disk_auto_delete+x}" ];
  then params="${params} disk_auto_delete=\"${PT_disk_auto_delete}\""
fi

if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_credentials_file+x}" ];
  then params="${params} credentials_file=\"${PT_credentials_file}\""
fi

if [ ! -z "${PT_image_family+x}" ];
  then params="${params} image_family=\"${PT_image_family}\""
fi

if [ ! -z "${PT_subnetwork+x}" ];
  then params="${params} subnetwork=\"${PT_subnetwork}\""
fi

if [ ! -z "${PT_project_id+x}" ];
  then params="${params} project_id=\"${PT_project_id}\""
fi

if [ ! -z "${PT_can_ip_forward+x}" ];
  then params="${params} can_ip_forward=\"${PT_can_ip_forward}\""
fi

if [ ! -z "${PT_preemptible+x}" ];
  then params="${params} preemptible=\"${PT_preemptible}\""
fi

if [ ! -z "${PT_metadata+x}" ];
  then params="${params} metadata=\"${PT_metadata}\""
fi

ansible localhost -m gce_instance_template --args "${params}" --one-line | cut -f2- -d">"