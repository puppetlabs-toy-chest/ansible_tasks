#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_feed+x}" ];
  then params="${params} feed=\"${PT_feed}\""
fi

if [ ! -z "${PT_repo_type+x}" ];
  then params="${params} repo_type=\"${PT_repo_type}\""
fi

if [ ! -z "${PT_pulp_host+x}" ];
  then params="${params} pulp_host=\"${PT_pulp_host}\""
fi

if [ ! -z "${PT_relative_url+x}" ];
  then params="${params} relative_url=\"${PT_relative_url}\""
fi

if [ ! -z "${PT_force_basic_auth+x}" ];
  then params="${params} force_basic_auth=\"${PT_force_basic_auth}\""
fi

if [ ! -z "${PT_importer_ssl_client_cert+x}" ];
  then params="${params} importer_ssl_client_cert=\"${PT_importer_ssl_client_cert}\""
fi

if [ ! -z "${PT_proxy_port+x}" ];
  then params="${params} proxy_port=\"${PT_proxy_port}\""
fi

if [ ! -z "${PT_serve_http+x}" ];
  then params="${params} serve_http=\"${PT_serve_http}\""
fi

if [ ! -z "${PT_wait_for_completion+x}" ];
  then params="${params} wait_for_completion=\"${PT_wait_for_completion}\""
fi

if [ ! -z "${PT_add_export_distributor+x}" ];
  then params="${params} add_export_distributor=\"${PT_add_export_distributor}\""
fi

if [ ! -z "${PT_url_password+x}" ];
  then params="${params} url_password=\"${PT_url_password}\""
fi

if [ ! -z "${PT_importer_ssl_client_key+x}" ];
  then params="${params} importer_ssl_client_key=\"${PT_importer_ssl_client_key}\""
fi

if [ ! -z "${PT_publish_distributor+x}" ];
  then params="${params} publish_distributor=\"${PT_publish_distributor}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_proxy_host+x}" ];
  then params="${params} proxy_host=\"${PT_proxy_host}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_serve_https+x}" ];
  then params="${params} serve_https=\"${PT_serve_https}\""
fi

if [ ! -z "${PT_importer_ssl_ca_cert+x}" ];
  then params="${params} importer_ssl_ca_cert=\"${PT_importer_ssl_ca_cert}\""
fi

if [ ! -z "${PT_url_username+x}" ];
  then params="${params} url_username=\"${PT_url_username}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m pulp_repo --args "${params}" --one-line | cut -f2- -d">"