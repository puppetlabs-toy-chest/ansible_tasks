#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_ha_reservation+x}" ];
  then params="${params} ha_reservation=\"${PT_ha_reservation}\""
fi

if [ ! -z "${PT_fence_skip_if_connectivity_broken+x}" ];
  then params="${params} fence_skip_if_connectivity_broken=\"${PT_fence_skip_if_connectivity_broken}\""
fi

if [ ! -z "${PT_virt+x}" ];
  then params="${params} virt=\"${PT_virt}\""
fi

if [ ! -z "${PT_threads_as_cores+x}" ];
  then params="${params} threads_as_cores=\"${PT_threads_as_cores}\""
fi

if [ ! -z "${PT_gluster+x}" ];
  then params="${params} gluster=\"${PT_gluster}\""
fi

if [ ! -z "${PT_vm_reason+x}" ];
  then params="${params} vm_reason=\"${PT_vm_reason}\""
fi

if [ ! -z "${PT_fetch_nested+x}" ];
  then params="${params} fetch_nested=\"${PT_fetch_nested}\""
fi

if [ ! -z "${PT_migration_bandwidth_limit+x}" ];
  then params="${params} migration_bandwidth_limit=\"${PT_migration_bandwidth_limit}\""
fi

if [ ! -z "${PT_data_center+x}" ];
  then params="${params} data_center=\"${PT_data_center}\""
fi

if [ ! -z "${PT_ksm_numa+x}" ];
  then params="${params} ksm_numa=\"${PT_ksm_numa}\""
fi

if [ ! -z "${PT_migration_auto_converge+x}" ];
  then params="${params} migration_auto_converge=\"${PT_migration_auto_converge}\""
fi

if [ ! -z "${PT_cpu_arch+x}" ];
  then params="${params} cpu_arch=\"${PT_cpu_arch}\""
fi

if [ ! -z "${PT_rng_sources+x}" ];
  then params="${params} rng_sources=\"${PT_rng_sources}\""
fi

if [ ! -z "${PT_compatibility_version+x}" ];
  then params="${params} compatibility_version=\"${PT_compatibility_version}\""
fi

if [ ! -z "${PT_network+x}" ];
  then params="${params} network=\"${PT_network}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_ksm+x}" ];
  then params="${params} ksm=\"${PT_ksm}\""
fi

if [ ! -z "${PT_migration_compressed+x}" ];
  then params="${params} migration_compressed=\"${PT_migration_compressed}\""
fi

if [ ! -z "${PT_ballooning+x}" ];
  then params="${params} ballooning=\"${PT_ballooning}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_fence_enabled+x}" ];
  then params="${params} fence_enabled=\"${PT_fence_enabled}\""
fi

if [ ! -z "${PT_migration_policy+x}" ];
  then params="${params} migration_policy=\"${PT_migration_policy}\""
fi

if [ ! -z "${PT_nested_attributes+x}" ];
  then params="${params} nested_attributes=\"${PT_nested_attributes}\""
fi

if [ ! -z "${PT_resilience_policy+x}" ];
  then params="${params} resilience_policy=\"${PT_resilience_policy}\""
fi

if [ ! -z "${PT_fence_connectivity_threshold+x}" ];
  then params="${params} fence_connectivity_threshold=\"${PT_fence_connectivity_threshold}\""
fi

if [ ! -z "${PT_spice_proxy+x}" ];
  then params="${params} spice_proxy=\"${PT_spice_proxy}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_memory_policy+x}" ];
  then params="${params} memory_policy=\"${PT_memory_policy}\""
fi

if [ ! -z "${PT_migration_bandwidth+x}" ];
  then params="${params} migration_bandwidth=\"${PT_migration_bandwidth}\""
fi

if [ ! -z "${PT_fence_skip_if_sd_active+x}" ];
  then params="${params} fence_skip_if_sd_active=\"${PT_fence_skip_if_sd_active}\""
fi

if [ ! -z "${PT_scheduling_policy+x}" ];
  then params="${params} scheduling_policy=\"${PT_scheduling_policy}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_switch_type+x}" ];
  then params="${params} switch_type=\"${PT_switch_type}\""
fi

if [ ! -z "${PT_serial_policy_value+x}" ];
  then params="${params} serial_policy_value=\"${PT_serial_policy_value}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_host_reason+x}" ];
  then params="${params} host_reason=\"${PT_host_reason}\""
fi

if [ ! -z "${PT_poll_interval+x}" ];
  then params="${params} poll_interval=\"${PT_poll_interval}\""
fi

if [ ! -z "${PT_cpu_type+x}" ];
  then params="${params} cpu_type=\"${PT_cpu_type}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_serial_policy+x}" ];
  then params="${params} serial_policy=\"${PT_serial_policy}\""
fi

if [ ! -z "${PT_trusted_service+x}" ];
  then params="${params} trusted_service=\"${PT_trusted_service}\""
fi

ansible localhost -m ovirt_clusters --args "${params}" --one-line | cut -f2- -d">"