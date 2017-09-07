#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_tls+x}" ];
  then params="${params} tls=\"${PT_tls}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_cacert_path+x}" ];
  then params="${params} cacert_path=\"${PT_cacert_path}\""
fi

if [ ! -z "${PT_config_path+x}" ];
  then params="${params} config_path=\"${PT_config_path}\""
fi

if [ ! -z "${PT_registry_url+x}" ];
  then params="${params} registry_url=\"${PT_registry_url}\""
fi

if [ ! -z "${PT_ssl_version+x}" ];
  then params="${params} ssl_version=\"${PT_ssl_version}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_tls_hostname+x}" ];
  then params="${params} tls_hostname=\"${PT_tls_hostname}\""
fi

if [ ! -z "${PT_docker_host+x}" ];
  then params="${params} docker_host=\"${PT_docker_host}\""
fi

if [ ! -z "${PT_tls_verify+x}" ];
  then params="${params} tls_verify=\"${PT_tls_verify}\""
fi

if [ ! -z "${PT_key_path+x}" ];
  then params="${params} key_path=\"${PT_key_path}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_cert_path+x}" ];
  then params="${params} cert_path=\"${PT_cert_path}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_email+x}" ];
  then params="${params} email=\"${PT_email}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

if [ ! -z "${PT_reauthorize+x}" ];
  then params="${params} reauthorize=\"${PT_reauthorize}\""
fi

ansible localhost -m docker_login --args "${params}" --one-line | cut -f2- -d">"