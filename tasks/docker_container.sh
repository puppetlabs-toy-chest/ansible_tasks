#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_tty+x}" ];
  then params="${params} tty=\"${PT_tty}\""
fi

if [ ! -z "${PT_dns_servers+x}" ];
  then params="${params} dns_servers=\"${PT_dns_servers}\""
fi

if [ ! -z "${PT_auto_remove+x}" ];
  then params="${params} auto_remove=\"${PT_auto_remove}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_labels+x}" ];
  then params="${params} labels=\"${PT_labels}\""
fi

if [ ! -z "${PT_docker_host+x}" ];
  then params="${params} docker_host=\"${PT_docker_host}\""
fi

if [ ! -z "${PT_cpuset_cpus+x}" ];
  then params="${params} cpuset_cpus=\"${PT_cpuset_cpus}\""
fi

if [ ! -z "${PT_force_kill+x}" ];
  then params="${params} force_kill=\"${PT_force_kill}\""
fi

if [ ! -z "${PT_pid_mode+x}" ];
  then params="${params} pid_mode=\"${PT_pid_mode}\""
fi

if [ ! -z "${PT_networks+x}" ];
  then params="${params} networks=\"${PT_networks}\""
fi

if [ ! -z "${PT_cpu_period+x}" ];
  then params="${params} cpu_period=\"${PT_cpu_period}\""
fi

if [ ! -z "${PT_tmpfs+x}" ];
  then params="${params} tmpfs=\"${PT_tmpfs}\""
fi

if [ ! -z "${PT_working_dir+x}" ];
  then params="${params} working_dir=\"${PT_working_dir}\""
fi

if [ ! -z "${PT_capabilities+x}" ];
  then params="${params} capabilities=\"${PT_capabilities}\""
fi

if [ ! -z "${PT_restart+x}" ];
  then params="${params} restart=\"${PT_restart}\""
fi

if [ ! -z "${PT_mac_address+x}" ];
  then params="${params} mac_address=\"${PT_mac_address}\""
fi

if [ ! -z "${PT_volumes_from+x}" ];
  then params="${params} volumes_from=\"${PT_volumes_from}\""
fi

if [ ! -z "${PT_log_options+x}" ];
  then params="${params} log_options=\"${PT_log_options}\""
fi

if [ ! -z "${PT_memory_reservation+x}" ];
  then params="${params} memory_reservation=\"${PT_memory_reservation}\""
fi

if [ ! -z "${PT_recreate+x}" ];
  then params="${params} recreate=\"${PT_recreate}\""
fi

if [ ! -z "${PT_ipc_mode+x}" ];
  then params="${params} ipc_mode=\"${PT_ipc_mode}\""
fi

if [ ! -z "${PT_memory+x}" ];
  then params="${params} memory=\"${PT_memory}\""
fi

if [ ! -z "${PT_memory_swappiness+x}" ];
  then params="${params} memory_swappiness=\"${PT_memory_swappiness}\""
fi

if [ ! -z "${PT_network_mode+x}" ];
  then params="${params} network_mode=\"${PT_network_mode}\""
fi

if [ ! -z "${PT_detach+x}" ];
  then params="${params} detach=\"${PT_detach}\""
fi

if [ ! -z "${PT_memory_swap+x}" ];
  then params="${params} memory_swap=\"${PT_memory_swap}\""
fi

if [ ! -z "${PT_pull+x}" ];
  then params="${params} pull=\"${PT_pull}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_stop_signal+x}" ];
  then params="${params} stop_signal=\"${PT_stop_signal}\""
fi

if [ ! -z "${PT_devices+x}" ];
  then params="${params} devices=\"${PT_devices}\""
fi

if [ ! -z "${PT_uts+x}" ];
  then params="${params} uts=\"${PT_uts}\""
fi

if [ ! -z "${PT_published_ports+x}" ];
  then params="${params} published_ports=\"${PT_published_ports}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_dns_search_domains+x}" ];
  then params="${params} dns_search_domains=\"${PT_dns_search_domains}\""
fi

if [ ! -z "${PT_ulimits+x}" ];
  then params="${params} ulimits=\"${PT_ulimits}\""
fi

if [ ! -z "${PT_interactive+x}" ];
  then params="${params} interactive=\"${PT_interactive}\""
fi

if [ ! -z "${PT_links+x}" ];
  then params="${params} links=\"${PT_links}\""
fi

if [ ! -z "${PT_oom_score_adj+x}" ];
  then params="${params} oom_score_adj=\"${PT_oom_score_adj}\""
fi

if [ ! -z "${PT_restart_policy+x}" ];
  then params="${params} restart_policy=\"${PT_restart_policy}\""
fi

if [ ! -z "${PT_paused+x}" ];
  then params="${params} paused=\"${PT_paused}\""
fi

if [ ! -z "${PT_tls_verify+x}" ];
  then params="${params} tls_verify=\"${PT_tls_verify}\""
fi

if [ ! -z "${PT_stop_timeout+x}" ];
  then params="${params} stop_timeout=\"${PT_stop_timeout}\""
fi

if [ ! -z "${PT_kernel_memory+x}" ];
  then params="${params} kernel_memory=\"${PT_kernel_memory}\""
fi

if [ ! -z "${PT_env_file+x}" ];
  then params="${params} env_file=\"${PT_env_file}\""
fi

if [ ! -z "${PT_cpu_quota+x}" ];
  then params="${params} cpu_quota=\"${PT_cpu_quota}\""
fi

if [ ! -z "${PT_read_only+x}" ];
  then params="${params} read_only=\"${PT_read_only}\""
fi

if [ ! -z "${PT_cpuset_mems+x}" ];
  then params="${params} cpuset_mems=\"${PT_cpuset_mems}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_cleanup+x}" ];
  then params="${params} cleanup=\"${PT_cleanup}\""
fi

if [ ! -z "${PT_entrypoint+x}" ];
  then params="${params} entrypoint=\"${PT_entrypoint}\""
fi

if [ ! -z "${PT_key_path+x}" ];
  then params="${params} key_path=\"${PT_key_path}\""
fi

if [ ! -z "${PT_env+x}" ];
  then params="${params} env=\"${PT_env}\""
fi

if [ ! -z "${PT_keep_volumes+x}" ];
  then params="${params} keep_volumes=\"${PT_keep_volumes}\""
fi

if [ ! -z "${PT_blkio_weight+x}" ];
  then params="${params} blkio_weight=\"${PT_blkio_weight}\""
fi

if [ ! -z "${PT_privileged+x}" ];
  then params="${params} privileged=\"${PT_privileged}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

if [ ! -z "${PT_exposed_ports+x}" ];
  then params="${params} exposed_ports=\"${PT_exposed_ports}\""
fi

if [ ! -z "${PT_trust_image_content+x}" ];
  then params="${params} trust_image_content=\"${PT_trust_image_content}\""
fi

if [ ! -z "${PT_cacert_path+x}" ];
  then params="${params} cacert_path=\"${PT_cacert_path}\""
fi

if [ ! -z "${PT_log_driver+x}" ];
  then params="${params} log_driver=\"${PT_log_driver}\""
fi

if [ ! -z "${PT_oom_killer+x}" ];
  then params="${params} oom_killer=\"${PT_oom_killer}\""
fi

if [ ! -z "${PT_shm_size+x}" ];
  then params="${params} shm_size=\"${PT_shm_size}\""
fi

if [ ! -z "${PT_kill_signal+x}" ];
  then params="${params} kill_signal=\"${PT_kill_signal}\""
fi

if [ ! -z "${PT_tls_hostname+x}" ];
  then params="${params} tls_hostname=\"${PT_tls_hostname}\""
fi

if [ ! -z "${PT_volume_driver+x}" ];
  then params="${params} volume_driver=\"${PT_volume_driver}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_groups+x}" ];
  then params="${params} groups=\"${PT_groups}\""
fi

if [ ! -z "${PT_cert_path+x}" ];
  then params="${params} cert_path=\"${PT_cert_path}\""
fi

if [ ! -z "${PT_purge_networks+x}" ];
  then params="${params} purge_networks=\"${PT_purge_networks}\""
fi

if [ ! -z "${PT_tls+x}" ];
  then params="${params} tls=\"${PT_tls}\""
fi

if [ ! -z "${PT_ignore_image+x}" ];
  then params="${params} ignore_image=\"${PT_ignore_image}\""
fi

if [ ! -z "${PT_ssl_version+x}" ];
  then params="${params} ssl_version=\"${PT_ssl_version}\""
fi

if [ ! -z "${PT_security_opts+x}" ];
  then params="${params} security_opts=\"${PT_security_opts}\""
fi

if [ ! -z "${PT_etc_hosts+x}" ];
  then params="${params} etc_hosts=\"${PT_etc_hosts}\""
fi

if [ ! -z "${PT_sysctls+x}" ];
  then params="${params} sysctls=\"${PT_sysctls}\""
fi

if [ ! -z "${PT_command+x}" ];
  then params="${params} command=\"${PT_command}\""
fi

if [ ! -z "${PT_volumes+x}" ];
  then params="${params} volumes=\"${PT_volumes}\""
fi

if [ ! -z "${PT_cpu_shares+x}" ];
  then params="${params} cpu_shares=\"${PT_cpu_shares}\""
fi

if [ ! -z "${PT_restart_retries+x}" ];
  then params="${params} restart_retries=\"${PT_restart_retries}\""
fi

ansible localhost -m docker_container --args "${params}" --one-line | cut -f2- -d">"