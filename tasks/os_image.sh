#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_auth_type+x}" ];
  then params="${params} auth_type=\"${PT_auth_type}\""
fi

if [ ! -z "${PT_ramdisk+x}" ];
  then params="${params} ramdisk=\"${PT_ramdisk}\""
fi

if [ ! -z "${PT_region_name+x}" ];
  then params="${params} region_name=\"${PT_region_name}\""
fi

if [ ! -z "${PT_kernel+x}" ];
  then params="${params} kernel=\"${PT_kernel}\""
fi

if [ ! -z "${PT_container_format+x}" ];
  then params="${params} container_format=\"${PT_container_format}\""
fi

if [ ! -z "${PT_min_ram+x}" ];
  then params="${params} min_ram=\"${PT_min_ram}\""
fi

if [ ! -z "${PT_api_timeout+x}" ];
  then params="${params} api_timeout=\"${PT_api_timeout}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_owner+x}" ];
  then params="${params} owner=\"${PT_owner}\""
fi

if [ ! -z "${PT_endpoint_type+x}" ];
  then params="${params} endpoint_type=\"${PT_endpoint_type}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_cacert+x}" ];
  then params="${params} cacert=\"${PT_cacert}\""
fi

if [ ! -z "${PT_is_public+x}" ];
  then params="${params} is_public=\"${PT_is_public}\""
fi

if [ ! -z "${PT_properties+x}" ];
  then params="${params} properties=\"${PT_properties}\""
fi

if [ ! -z "${PT_cloud+x}" ];
  then params="${params} cloud=\"${PT_cloud}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_min_disk+x}" ];
  then params="${params} min_disk=\"${PT_min_disk}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_availability_zone+x}" ];
  then params="${params} availability_zone=\"${PT_availability_zone}\""
fi

if [ ! -z "${PT_disk_format+x}" ];
  then params="${params} disk_format=\"${PT_disk_format}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_filename+x}" ];
  then params="${params} filename=\"${PT_filename}\""
fi

if [ ! -z "${PT_cert+x}" ];
  then params="${params} cert=\"${PT_cert}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m os_image --args "${params}" --one-line | cut -f2- -d">"