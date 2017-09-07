#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_accepted_ciphers+x}" ];
  then params="${params} accepted_ciphers=\"${PT_accepted_ciphers}\""
fi

if [ ! -z "${PT_prefer_client_cipher_ordering+x}" ];
  then params="${params} prefer_client_cipher_ordering=\"${PT_prefer_client_cipher_ordering}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_accepted_versions+x}" ];
  then params="${params} accepted_versions=\"${PT_accepted_versions}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_ssl_session_timeout+x}" ];
  then params="${params} ssl_session_timeout=\"${PT_ssl_session_timeout}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_tenant_ref+x}" ];
  then params="${params} tenant_ref=\"${PT_tenant_ref}\""
fi

if [ ! -z "${PT_cipher_enums+x}" ];
  then params="${params} cipher_enums=\"${PT_cipher_enums}\""
fi

if [ ! -z "${PT_enable_ssl_session_reuse+x}" ];
  then params="${params} enable_ssl_session_reuse=\"${PT_enable_ssl_session_reuse}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_send_close_notify+x}" ];
  then params="${params} send_close_notify=\"${PT_send_close_notify}\""
fi

if [ ! -z "${PT_dhparam+x}" ];
  then params="${params} dhparam=\"${PT_dhparam}\""
fi

if [ ! -z "${PT_ssl_rating+x}" ];
  then params="${params} ssl_rating=\"${PT_ssl_rating}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

ansible localhost -m avi_sslprofile --args "${params}" --one-line | cut -f2- -d">"