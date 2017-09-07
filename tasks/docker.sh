#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_publish_all_ports+x}" ];
  then params="${params} publish_all_ports=\"${PT_publish_all_ports}\""
fi

if [ ! -z "${PT_tty+x}" ];
  then params="${params} tty=\"${PT_tty}\""
fi

if [ ! -z "${PT_log_opt+x}" ];
  then params="${params} log_opt=\"${PT_log_opt}\""
fi

if [ ! -z "${PT_insecure_registry+x}" ];
  then params="${params} insecure_registry=\"${PT_insecure_registry}\""
fi

if [ ! -z "${PT_links+x}" ];
  then params="${params} links=\"${PT_links}\""
fi

if [ ! -z "${PT_memory_limit+x}" ];
  then params="${params} memory_limit=\"${PT_memory_limit}\""
fi

if [ ! -z "${PT_docker_url+x}" ];
  then params="${params} docker_url=\"${PT_docker_url}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_labels+x}" ];
  then params="${params} labels=\"${PT_labels}\""
fi

if [ ! -z "${PT_pid+x}" ];
  then params="${params} pid=\"${PT_pid}\""
fi

if [ ! -z "${PT_docker_api_version+x}" ];
  then params="${params} docker_api_version=\"${PT_docker_api_version}\""
fi

if [ ! -z "${PT_stop_timeout+x}" ];
  then params="${params} stop_timeout=\"${PT_stop_timeout}\""
fi

if [ ! -z "${PT_tls_client_key+x}" ];
  then params="${params} tls_client_key=\"${PT_tls_client_key}\""
fi

if [ ! -z "${PT_privileged+x}" ];
  then params="${params} privileged=\"${PT_privileged}\""
fi

if [ ! -z "${PT_env_file+x}" ];
  then params="${params} env_file=\"${PT_env_file}\""
fi

if [ ! -z "${PT_read_only+x}" ];
  then params="${params} read_only=\"${PT_read_only}\""
fi

if [ ! -z "${PT_use_tls+x}" ];
  then params="${params} use_tls=\"${PT_use_tls}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_lxc_conf+x}" ];
  then params="${params} lxc_conf=\"${PT_lxc_conf}\""
fi

if [ ! -z "${PT_tls_ca_cert+x}" ];
  then params="${params} tls_ca_cert=\"${PT_tls_ca_cert}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_tls_client_cert+x}" ];
  then params="${params} tls_client_cert=\"${PT_tls_client_cert}\""
fi

if [ ! -z "${PT_entrypoint+x}" ];
  then params="${params} entrypoint=\"${PT_entrypoint}\""
fi

if [ ! -z "${PT_env+x}" ];
  then params="${params} env=\"${PT_env}\""
fi

if [ ! -z "${PT_volumes_from+x}" ];
  then params="${params} volumes_from=\"${PT_volumes_from}\""
fi

if [ ! -z "${PT_net+x}" ];
  then params="${params} net=\"${PT_net}\""
fi

if [ ! -z "${PT_email+x}" ];
  then params="${params} email=\"${PT_email}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_docker_user+x}" ];
  then params="${params} docker_user=\"${PT_docker_user}\""
fi

if [ ! -z "${PT_log_driver+x}" ];
  then params="${params} log_driver=\"${PT_log_driver}\""
fi

if [ ! -z "${PT_expose+x}" ];
  then params="${params} expose=\"${PT_expose}\""
fi

if [ ! -z "${PT_stdin_open+x}" ];
  then params="${params} stdin_open=\"${PT_stdin_open}\""
fi

if [ ! -z "${PT_tls_hostname+x}" ];
  then params="${params} tls_hostname=\"${PT_tls_hostname}\""
fi

if [ ! -z "${PT_domainname+x}" ];
  then params="${params} domainname=\"${PT_domainname}\""
fi

if [ ! -z "${PT_registry+x}" ];
  then params="${params} registry=\"${PT_registry}\""
fi

if [ ! -z "${PT_volumes+x}" ];
  then params="${params} volumes=\"${PT_volumes}\""
fi

if [ ! -z "${PT_detach+x}" ];
  then params="${params} detach=\"${PT_detach}\""
fi

if [ ! -z "${PT_cpu_set+x}" ];
  then params="${params} cpu_set=\"${PT_cpu_set}\""
fi

if [ ! -z "${PT_pull+x}" ];
  then params="${params} pull=\"${PT_pull}\""
fi

if [ ! -z "${PT_dns+x}" ];
  then params="${params} dns=\"${PT_dns}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_signal+x}" ];
  then params="${params} signal=\"${PT_signal}\""
fi

if [ ! -z "${PT_cap_add+x}" ];
  then params="${params} cap_add=\"${PT_cap_add}\""
fi

if [ ! -z "${PT_restart_policy+x}" ];
  then params="${params} restart_policy=\"${PT_restart_policy}\""
fi

if [ ! -z "${PT_count+x}" ];
  then params="${params} count=\"${PT_count}\""
fi

if [ ! -z "${PT_devices+x}" ];
  then params="${params} devices=\"${PT_devices}\""
fi

if [ ! -z "${PT_extra_hosts+x}" ];
  then params="${params} extra_hosts=\"${PT_extra_hosts}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_restart_policy_retry+x}" ];
  then params="${params} restart_policy_retry=\"${PT_restart_policy_retry}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_cap_drop+x}" ];
  then params="${params} cap_drop=\"${PT_cap_drop}\""
fi

if [ ! -z "${PT_ports+x}" ];
  then params="${params} ports=\"${PT_ports}\""
fi

if [ ! -z "${PT_ulimits+x}" ];
  then params="${params} ulimits=\"${PT_ulimits}\""
fi

if [ ! -z "${PT_cpu_shares+x}" ];
  then params="${params} cpu_shares=\"${PT_cpu_shares}\""
fi

ansible localhost -m docker --args "${params}" --one-line | cut -f2- -d">"