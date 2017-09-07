#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_files+x}" ];
  then params="${params} files=\"${PT_files}\""
fi

if [ ! -z "${PT_cacert_path+x}" ];
  then params="${params} cacert_path=\"${PT_cacert_path}\""
fi

if [ ! -z "${PT_project_src+x}" ];
  then params="${params} project_src=\"${PT_project_src}\""
fi

if [ ! -z "${PT_hostname_check+x}" ];
  then params="${params} hostname_check=\"${PT_hostname_check}\""
fi

if [ ! -z "${PT_project_name+x}" ];
  then params="${params} project_name=\"${PT_project_name}\""
fi

if [ ! -z "${PT_recreate+x}" ];
  then params="${params} recreate=\"${PT_recreate}\""
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

if [ ! -z "${PT_remove_images+x}" ];
  then params="${params} remove_images=\"${PT_remove_images}\""
fi

if [ ! -z "${PT_services+x}" ];
  then params="${params} services=\"${PT_services}\""
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

if [ ! -z "${PT_scale+x}" ];
  then params="${params} scale=\"${PT_scale}\""
fi

if [ ! -z "${PT_nocache+x}" ];
  then params="${params} nocache=\"${PT_nocache}\""
fi

if [ ! -z "${PT_restarted+x}" ];
  then params="${params} restarted=\"${PT_restarted}\""
fi

if [ ! -z "${PT_ssl_version+x}" ];
  then params="${params} ssl_version=\"${PT_ssl_version}\""
fi

if [ ! -z "${PT_remove_volumes+x}" ];
  then params="${params} remove_volumes=\"${PT_remove_volumes}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_dependencies+x}" ];
  then params="${params} dependencies=\"${PT_dependencies}\""
fi

if [ ! -z "${PT_stopped+x}" ];
  then params="${params} stopped=\"${PT_stopped}\""
fi

if [ ! -z "${PT_key_path+x}" ];
  then params="${params} key_path=\"${PT_key_path}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_debug+x}" ];
  then params="${params} debug=\"${PT_debug}\""
fi

if [ ! -z "${PT_definition+x}" ];
  then params="${params} definition=\"${PT_definition}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

if [ ! -z "${PT_build+x}" ];
  then params="${params} build=\"${PT_build}\""
fi

ansible localhost -m docker_service --args "${params}" --one-line | cut -f2- -d">"