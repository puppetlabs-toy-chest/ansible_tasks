#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_custom_id+x}" ];
  then params="${params} custom_id=\"${PT_custom_id}\""
fi

if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_disk_offering+x}" ];
  then params="${params} disk_offering=\"${PT_disk_offering}\""
fi

if [ ! -z "${PT_api_http_method+x}" ];
  then params="${params} api_http_method=\"${PT_api_http_method}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_api_secret+x}" ];
  then params="${params} api_secret=\"${PT_api_secret}\""
fi

if [ ! -z "${PT_api_timeout+x}" ];
  then params="${params} api_timeout=\"${PT_api_timeout}\""
fi

if [ ! -z "${PT_shrink_ok+x}" ];
  then params="${params} shrink_ok=\"${PT_shrink_ok}\""
fi

if [ ! -z "${PT_vm+x}" ];
  then params="${params} vm=\"${PT_vm}\""
fi

if [ ! -z "${PT_display_volume+x}" ];
  then params="${params} display_volume=\"${PT_display_volume}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_min_iops+x}" ];
  then params="${params} min_iops=\"${PT_min_iops}\""
fi

if [ ! -z "${PT_size+x}" ];
  then params="${params} size=\"${PT_size}\""
fi

if [ ! -z "${PT_account+x}" ];
  then params="${params} account=\"${PT_account}\""
fi

if [ ! -z "${PT_poll_async+x}" ];
  then params="${params} poll_async=\"${PT_poll_async}\""
fi

if [ ! -z "${PT_api_url+x}" ];
  then params="${params} api_url=\"${PT_api_url}\""
fi

if [ ! -z "${PT_zone+x}" ];
  then params="${params} zone=\"${PT_zone}\""
fi

if [ ! -z "${PT_api_region+x}" ];
  then params="${params} api_region=\"${PT_api_region}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_project+x}" ];
  then params="${params} project=\"${PT_project}\""
fi

if [ ! -z "${PT_max_iops+x}" ];
  then params="${params} max_iops=\"${PT_max_iops}\""
fi

if [ ! -z "${PT_snapshot+x}" ];
  then params="${params} snapshot=\"${PT_snapshot}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

ansible localhost -m cs_volume --args "${params}" --one-line | cut -f2- -d">"