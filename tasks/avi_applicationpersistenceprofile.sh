#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_ip_persistence_profile+x}" ];
  then params="${params} ip_persistence_profile=\"${PT_ip_persistence_profile}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_app_cookie_persistence_profile+x}" ];
  then params="${params} app_cookie_persistence_profile=\"${PT_app_cookie_persistence_profile}\""
fi

if [ ! -z "${PT_persistence_type+x}" ];
  then params="${params} persistence_type=\"${PT_persistence_type}\""
fi

if [ ! -z "${PT_tenant_ref+x}" ];
  then params="${params} tenant_ref=\"${PT_tenant_ref}\""
fi

if [ ! -z "${PT_server_hm_down_recovery+x}" ];
  then params="${params} server_hm_down_recovery=\"${PT_server_hm_down_recovery}\""
fi

if [ ! -z "${PT_http_cookie_persistence_profile+x}" ];
  then params="${params} http_cookie_persistence_profile=\"${PT_http_cookie_persistence_profile}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_hdr_persistence_profile+x}" ];
  then params="${params} hdr_persistence_profile=\"${PT_hdr_persistence_profile}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

ansible localhost -m avi_applicationpersistenceprofile --args "${params}" --one-line | cut -f2- -d">"