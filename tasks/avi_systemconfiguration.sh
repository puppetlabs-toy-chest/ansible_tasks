#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_docker_mode+x}" ];
  then params="${params} docker_mode=\"${PT_docker_mode}\""
fi

if [ ! -z "${PT_dns_configuration+x}" ];
  then params="${params} dns_configuration=\"${PT_dns_configuration}\""
fi

if [ ! -z "${PT_proxy_configuration+x}" ];
  then params="${params} proxy_configuration=\"${PT_proxy_configuration}\""
fi

if [ ! -z "${PT_ssh_hmacs+x}" ];
  then params="${params} ssh_hmacs=\"${PT_ssh_hmacs}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_portal_configuration+x}" ];
  then params="${params} portal_configuration=\"${PT_portal_configuration}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_email_configuration+x}" ];
  then params="${params} email_configuration=\"${PT_email_configuration}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_snmp_configuration+x}" ];
  then params="${params} snmp_configuration=\"${PT_snmp_configuration}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_tech_support_uploader_configuration+x}" ];
  then params="${params} tech_support_uploader_configuration=\"${PT_tech_support_uploader_configuration}\""
fi

if [ ! -z "${PT_linux_configuration+x}" ];
  then params="${params} linux_configuration=\"${PT_linux_configuration}\""
fi

if [ ! -z "${PT_global_tenant_config+x}" ];
  then params="${params} global_tenant_config=\"${PT_global_tenant_config}\""
fi

if [ ! -z "${PT_dns_virtualservice_refs+x}" ];
  then params="${params} dns_virtualservice_refs=\"${PT_dns_virtualservice_refs}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_ntp_configuration+x}" ];
  then params="${params} ntp_configuration=\"${PT_ntp_configuration}\""
fi

if [ ! -z "${PT_admin_auth_configuration+x}" ];
  then params="${params} admin_auth_configuration=\"${PT_admin_auth_configuration}\""
fi

if [ ! -z "${PT_mgmt_ip_access_control+x}" ];
  then params="${params} mgmt_ip_access_control=\"${PT_mgmt_ip_access_control}\""
fi

if [ ! -z "${PT_ssh_ciphers+x}" ];
  then params="${params} ssh_ciphers=\"${PT_ssh_ciphers}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

ansible localhost -m avi_systemconfiguration --args "${params}" --one-line | cut -f2- -d">"