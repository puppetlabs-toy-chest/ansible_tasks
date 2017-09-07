#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_archive_path+x}" ];
  then params="${params} archive_path=\"${PT_archive_path}\""
fi

if [ ! -z "${PT_cacert_path+x}" ];
  then params="${params} cacert_path=\"${PT_cacert_path}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_buildargs+x}" ];
  then params="${params} buildargs=\"${PT_buildargs}\""
fi

if [ ! -z "${PT_repository+x}" ];
  then params="${params} repository=\"${PT_repository}\""
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

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_cert_path+x}" ];
  then params="${params} cert_path=\"${PT_cert_path}\""
fi

if [ ! -z "${PT_tls+x}" ];
  then params="${params} tls=\"${PT_tls}\""
fi

if [ ! -z "${PT_pull+x}" ];
  then params="${params} pull=\"${PT_pull}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_nocache+x}" ];
  then params="${params} nocache=\"${PT_nocache}\""
fi

if [ ! -z "${PT_container_limits+x}" ];
  then params="${params} container_limits=\"${PT_container_limits}\""
fi

if [ ! -z "${PT_dockerfile+x}" ];
  then params="${params} dockerfile=\"${PT_dockerfile}\""
fi

if [ ! -z "${PT_ssl_version+x}" ];
  then params="${params} ssl_version=\"${PT_ssl_version}\""
fi

if [ ! -z "${PT_load_path+x}" ];
  then params="${params} load_path=\"${PT_load_path}\""
fi

if [ ! -z "${PT_use_tls+x}" ];
  then params="${params} use_tls=\"${PT_use_tls}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_tag+x}" ];
  then params="${params} tag=\"${PT_tag}\""
fi

if [ ! -z "${PT_key_path+x}" ];
  then params="${params} key_path=\"${PT_key_path}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_push+x}" ];
  then params="${params} push=\"${PT_push}\""
fi

if [ ! -z "${PT_rm+x}" ];
  then params="${params} rm=\"${PT_rm}\""
fi

if [ ! -z "${PT_http_timeout+x}" ];
  then params="${params} http_timeout=\"${PT_http_timeout}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

ansible localhost -m docker_image --args "${params}" --one-line | cut -f2- -d">"