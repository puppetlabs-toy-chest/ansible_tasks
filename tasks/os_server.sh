#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_auth_type+x}" ];
  then params="${params} auth_type=\"${PT_auth_type}\""
fi

if [ ! -z "${PT_availability_zone+x}" ];
  then params="${params} availability_zone=\"${PT_availability_zone}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_image_exclude+x}" ];
  then params="${params} image_exclude=\"${PT_image_exclude}\""
fi

if [ ! -z "${PT_flavor_include+x}" ];
  then params="${params} flavor_include=\"${PT_flavor_include}\""
fi

if [ ! -z "${PT_meta+x}" ];
  then params="${params} meta=\"${PT_meta}\""
fi

if [ ! -z "${PT_flavor+x}" ];
  then params="${params} flavor=\"${PT_flavor}\""
fi

if [ ! -z "${PT_cloud+x}" ];
  then params="${params} cloud=\"${PT_cloud}\""
fi

if [ ! -z "${PT_scheduler_hints+x}" ];
  then params="${params} scheduler_hints=\"${PT_scheduler_hints}\""
fi

if [ ! -z "${PT_boot_from_volume+x}" ];
  then params="${params} boot_from_volume=\"${PT_boot_from_volume}\""
fi

if [ ! -z "${PT_userdata+x}" ];
  then params="${params} userdata=\"${PT_userdata}\""
fi

if [ ! -z "${PT_network+x}" ];
  then params="${params} network=\"${PT_network}\""
fi

if [ ! -z "${PT_terminate_volume+x}" ];
  then params="${params} terminate_volume=\"${PT_terminate_volume}\""
fi

if [ ! -z "${PT_nics+x}" ];
  then params="${params} nics=\"${PT_nics}\""
fi

if [ ! -z "${PT_floating_ips+x}" ];
  then params="${params} floating_ips=\"${PT_floating_ips}\""
fi

if [ ! -z "${PT_flavor_ram+x}" ];
  then params="${params} flavor_ram=\"${PT_flavor_ram}\""
fi

if [ ! -z "${PT_volume_size+x}" ];
  then params="${params} volume_size=\"${PT_volume_size}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_auto_ip+x}" ];
  then params="${params} auto_ip=\"${PT_auto_ip}\""
fi

if [ ! -z "${PT_security_groups+x}" ];
  then params="${params} security_groups=\"${PT_security_groups}\""
fi

if [ ! -z "${PT_config_drive+x}" ];
  then params="${params} config_drive=\"${PT_config_drive}\""
fi

if [ ! -z "${PT_region_name+x}" ];
  then params="${params} region_name=\"${PT_region_name}\""
fi

if [ ! -z "${PT_key_name+x}" ];
  then params="${params} key_name=\"${PT_key_name}\""
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

if [ ! -z "${PT_boot_volume+x}" ];
  then params="${params} boot_volume=\"${PT_boot_volume}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_cacert+x}" ];
  then params="${params} cacert=\"${PT_cacert}\""
fi

if [ ! -z "${PT_volumes+x}" ];
  then params="${params} volumes=\"${PT_volumes}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_delete_fip+x}" ];
  then params="${params} delete_fip=\"${PT_delete_fip}\""
fi

if [ ! -z "${PT_cert+x}" ];
  then params="${params} cert=\"${PT_cert}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_floating_ip_pools+x}" ];
  then params="${params} floating_ip_pools=\"${PT_floating_ip_pools}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_reuse_ips+x}" ];
  then params="${params} reuse_ips=\"${PT_reuse_ips}\""
fi

ansible localhost -m os_server --args "${params}" --one-line | cut -f2- -d">"