#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_hosted_engine+x}" ];
  then params="${params} hosted_engine=\"${PT_hosted_engine}\""
fi

if [ ! -z "${PT_nested_attributes+x}" ];
  then params="${params} nested_attributes=\"${PT_nested_attributes}\""
fi

if [ ! -z "${PT_cluster+x}" ];
  then params="${params} cluster=\"${PT_cluster}\""
fi

if [ ! -z "${PT_fetch_nested+x}" ];
  then params="${params} fetch_nested=\"${PT_fetch_nested}\""
fi

if [ ! -z "${PT_auth+x}" ];
  then params="${params} auth=\"${PT_auth}\""
fi

if [ ! -z "${PT_address+x}" ];
  then params="${params} address=\"${PT_address}\""
fi

if [ ! -z "${PT_override_iptables+x}" ];
  then params="${params} override_iptables=\"${PT_override_iptables}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_public_key+x}" ];
  then params="${params} public_key=\"${PT_public_key}\""
fi

if [ ! -z "${PT_kdump_integration+x}" ];
  then params="${params} kdump_integration=\"${PT_kdump_integration}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_spm_priority+x}" ];
  then params="${params} spm_priority=\"${PT_spm_priority}\""
fi

if [ ! -z "${PT_poll_interval+x}" ];
  then params="${params} poll_interval=\"${PT_poll_interval}\""
fi

if [ ! -z "${PT_kernel_params+x}" ];
  then params="${params} kernel_params=\"${PT_kernel_params}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_override_display+x}" ];
  then params="${params} override_display=\"${PT_override_display}\""
fi

ansible localhost -m ovirt_hosts --args "${params}" --one-line | cut -f2- -d">"