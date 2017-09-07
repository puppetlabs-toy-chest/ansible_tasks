#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_metalink+x}" ];
  then params="${params} metalink=\"${PT_metalink}\""
fi

if [ ! -z "${PT_ip_resolve+x}" ];
  then params="${params} ip_resolve=\"${PT_ip_resolve}\""
fi

if [ ! -z "${PT_reposdir+x}" ];
  then params="${params} reposdir=\"${PT_reposdir}\""
fi

if [ ! -z "${PT_proxy_password+x}" ];
  then params="${params} proxy_password=\"${PT_proxy_password}\""
fi

if [ ! -z "${PT_mirrorlist_expire+x}" ];
  then params="${params} mirrorlist_expire=\"${PT_mirrorlist_expire}\""
fi

if [ ! -z "${PT_bandwidth+x}" ];
  then params="${params} bandwidth=\"${PT_bandwidth}\""
fi

if [ ! -z "${PT_cost+x}" ];
  then params="${params} cost=\"${PT_cost}\""
fi

if [ ! -z "${PT_file+x}" ];
  then params="${params} file=\"${PT_file}\""
fi

if [ ! -z "${PT_owner+x}" ];
  then params="${params} owner=\"${PT_owner}\""
fi

if [ ! -z "${PT_exclude+x}" ];
  then params="${params} exclude=\"${PT_exclude}\""
fi

if [ ! -z "${PT_keepalive+x}" ];
  then params="${params} keepalive=\"${PT_keepalive}\""
fi

if [ ! -z "${PT_repo_gpgcheck+x}" ];
  then params="${params} repo_gpgcheck=\"${PT_repo_gpgcheck}\""
fi

if [ ! -z "${PT_group+x}" ];
  then params="${params} group=\"${PT_group}\""
fi

if [ ! -z "${PT_failovermethod+x}" ];
  then params="${params} failovermethod=\"${PT_failovermethod}\""
fi

if [ ! -z "${PT_unsafe_writes+x}" ];
  then params="${params} unsafe_writes=\"${PT_unsafe_writes}\""
fi

if [ ! -z "${PT_deltarpm_metadata_percentage+x}" ];
  then params="${params} deltarpm_metadata_percentage=\"${PT_deltarpm_metadata_percentage}\""
fi

if [ ! -z "${PT_gpgkey+x}" ];
  then params="${params} gpgkey=\"${PT_gpgkey}\""
fi

if [ ! -z "${PT_setype+x}" ];
  then params="${params} setype=\"${PT_setype}\""
fi

if [ ! -z "${PT_http_caching+x}" ];
  then params="${params} http_caching=\"${PT_http_caching}\""
fi

if [ ! -z "${PT_priority+x}" ];
  then params="${params} priority=\"${PT_priority}\""
fi

if [ ! -z "${PT_serole+x}" ];
  then params="${params} serole=\"${PT_serole}\""
fi

if [ ! -z "${PT_mirrorlist+x}" ];
  then params="${params} mirrorlist=\"${PT_mirrorlist}\""
fi

if [ ! -z "${PT_params+x}" ];
  then params="${params} params=\"${PT_params}\""
fi

if [ ! -z "${PT_gpgcheck+x}" ];
  then params="${params} gpgcheck=\"${PT_gpgcheck}\""
fi

if [ ! -z "${PT_include+x}" ];
  then params="${params} include=\"${PT_include}\""
fi

if [ ! -z "${PT_proxy_username+x}" ];
  then params="${params} proxy_username=\"${PT_proxy_username}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_ui_repoid_vars+x}" ];
  then params="${params} ui_repoid_vars=\"${PT_ui_repoid_vars}\""
fi

if [ ! -z "${PT_metadata_expire+x}" ];
  then params="${params} metadata_expire=\"${PT_metadata_expire}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_selevel+x}" ];
  then params="${params} selevel=\"${PT_selevel}\""
fi

if [ ! -z "${PT_sslclientcert+x}" ];
  then params="${params} sslclientcert=\"${PT_sslclientcert}\""
fi

if [ ! -z "${PT_baseurl+x}" ];
  then params="${params} baseurl=\"${PT_baseurl}\""
fi

if [ ! -z "${PT_gpgcakey+x}" ];
  then params="${params} gpgcakey=\"${PT_gpgcakey}\""
fi

if [ ! -z "${PT_s3_enabled+x}" ];
  then params="${params} s3_enabled=\"${PT_s3_enabled}\""
fi

if [ ! -z "${PT_async+x}" ];
  then params="${params} async=\"${PT_async}\""
fi

if [ ! -z "${PT_sslcacert+x}" ];
  then params="${params} sslcacert=\"${PT_sslcacert}\""
fi

if [ ! -z "${PT_includepkgs+x}" ];
  then params="${params} includepkgs=\"${PT_includepkgs}\""
fi

if [ ! -z "${PT_enablegroups+x}" ];
  then params="${params} enablegroups=\"${PT_enablegroups}\""
fi

if [ ! -z "${PT_sslverify+x}" ];
  then params="${params} sslverify=\"${PT_sslverify}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_retries+x}" ];
  then params="${params} retries=\"${PT_retries}\""
fi

if [ ! -z "${PT_protect+x}" ];
  then params="${params} protect=\"${PT_protect}\""
fi

if [ ! -z "${PT_ssl_check_cert_permissions+x}" ];
  then params="${params} ssl_check_cert_permissions=\"${PT_ssl_check_cert_permissions}\""
fi

if [ ! -z "${PT_throttle+x}" ];
  then params="${params} throttle=\"${PT_throttle}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_deltarpm_percentage+x}" ];
  then params="${params} deltarpm_percentage=\"${PT_deltarpm_percentage}\""
fi

if [ ! -z "${PT_sslclientkey+x}" ];
  then params="${params} sslclientkey=\"${PT_sslclientkey}\""
fi

if [ ! -z "${PT_seuser+x}" ];
  then params="${params} seuser=\"${PT_seuser}\""
fi

if [ ! -z "${PT_enabled+x}" ];
  then params="${params} enabled=\"${PT_enabled}\""
fi

if [ ! -z "${PT_skip_if_unavailable+x}" ];
  then params="${params} skip_if_unavailable=\"${PT_skip_if_unavailable}\""
fi

if [ ! -z "${PT_keepcache+x}" ];
  then params="${params} keepcache=\"${PT_keepcache}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_attributes+x}" ];
  then params="${params} attributes=\"${PT_attributes}\""
fi

if [ ! -z "${PT_metadata_expire_filter+x}" ];
  then params="${params} metadata_expire_filter=\"${PT_metadata_expire_filter}\""
fi

if [ ! -z "${PT_proxy+x}" ];
  then params="${params} proxy=\"${PT_proxy}\""
fi

ansible localhost -m yum_repository --args "${params}" --one-line | cut -f2- -d">"