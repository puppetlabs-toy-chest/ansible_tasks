#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_status+x}" ];
  then params="${params} status=\"${PT_status}\""
fi

if [ ! -z "${PT_certificate_management_profile_ref+x}" ];
  then params="${params} certificate_management_profile_ref=\"${PT_certificate_management_profile_ref}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_key+x}" ];
  then params="${params} key=\"${PT_key}\""
fi

if [ ! -z "${PT_key_params+x}" ];
  then params="${params} key_params=\"${PT_key_params}\""
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

if [ ! -z "${PT_enckey_base64+x}" ];
  then params="${params} enckey_base64=\"${PT_enckey_base64}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_dynamic_params+x}" ];
  then params="${params} dynamic_params=\"${PT_dynamic_params}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_enckey_name+x}" ];
  then params="${params} enckey_name=\"${PT_enckey_name}\""
fi

if [ ! -z "${PT_tenant_ref+x}" ];
  then params="${params} tenant_ref=\"${PT_tenant_ref}\""
fi

if [ ! -z "${PT_hardwaresecuritymodulegroup_ref+x}" ];
  then params="${params} hardwaresecuritymodulegroup_ref=\"${PT_hardwaresecuritymodulegroup_ref}\""
fi

if [ ! -z "${PT_created_by+x}" ];
  then params="${params} created_by=\"${PT_created_by}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_certificate+x}" ];
  then params="${params} certificate=\"${PT_certificate}\""
fi

if [ ! -z "${PT_ca_certs+x}" ];
  then params="${params} ca_certs=\"${PT_ca_certs}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

ansible localhost -m avi_sslkeyandcertificate --args "${params}" --one-line | cut -f2- -d">"