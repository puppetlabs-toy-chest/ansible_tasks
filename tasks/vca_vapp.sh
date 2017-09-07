#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_vm_name+x}" ];
  then params="${params} vm_name=\"${PT_vm_name}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_vm_memory+x}" ];
  then params="${params} vm_memory=\"${PT_vm_memory}\""
fi

if [ ! -z "${PT_template_name+x}" ];
  then params="${params} template_name=\"${PT_template_name}\""
fi

if [ ! -z "${PT_network_mode+x}" ];
  then params="${params} network_mode=\"${PT_network_mode}\""
fi

if [ ! -z "${PT_vapp_name+x}" ];
  then params="${params} vapp_name=\"${PT_vapp_name}\""
fi

if [ ! -z "${PT_org+x}" ];
  then params="${params} org=\"${PT_org}\""
fi

if [ ! -z "${PT_operation+x}" ];
  then params="${params} operation=\"${PT_operation}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_vm_cpus+x}" ];
  then params="${params} vm_cpus=\"${PT_vm_cpus}\""
fi

if [ ! -z "${PT_vdc_name+x}" ];
  then params="${params} vdc_name=\"${PT_vdc_name}\""
fi

if [ ! -z "${PT_network_name+x}" ];
  then params="${params} network_name=\"${PT_network_name}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_instance_id+x}" ];
  then params="${params} instance_id=\"${PT_instance_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_service_type+x}" ];
  then params="${params} service_type=\"${PT_service_type}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

ansible localhost -m vca_vapp --args "${params}" --one-line | cut -f2- -d">"