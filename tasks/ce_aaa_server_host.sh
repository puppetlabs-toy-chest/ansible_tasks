#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_radius_server_port+x}" ];
  then params="${params} radius_server_port=\"${PT_radius_server_port}\""
fi

if [ ! -z "${PT_hwtacacs_server_ipv6+x}" ];
  then params="${params} hwtacacs_server_ipv6=\"${PT_hwtacacs_server_ipv6}\""
fi

if [ ! -z "${PT_local_service_type+x}" ];
  then params="${params} local_service_type=\"${PT_local_service_type}\""
fi

if [ ! -z "${PT_radius_server_name+x}" ];
  then params="${params} radius_server_name=\"${PT_radius_server_name}\""
fi

if [ ! -z "${PT_radius_server_mode+x}" ];
  then params="${params} radius_server_mode=\"${PT_radius_server_mode}\""
fi

if [ ! -z "${PT_hwtacacs_server_type+x}" ];
  then params="${params} hwtacacs_server_type=\"${PT_hwtacacs_server_type}\""
fi

if [ ! -z "${PT_radius_vpn_name+x}" ];
  then params="${params} radius_vpn_name=\"${PT_radius_vpn_name}\""
fi

if [ ! -z "${PT_radius_server_ipv6+x}" ];
  then params="${params} radius_server_ipv6=\"${PT_radius_server_ipv6}\""
fi

if [ ! -z "${PT_radius_server_type+x}" ];
  then params="${params} radius_server_type=\"${PT_radius_server_type}\""
fi

if [ ! -z "${PT_hwtacacs_server_ip+x}" ];
  then params="${params} hwtacacs_server_ip=\"${PT_hwtacacs_server_ip}\""
fi

if [ ! -z "${PT_local_user_group+x}" ];
  then params="${params} local_user_group=\"${PT_local_user_group}\""
fi

if [ ! -z "${PT_local_user_level+x}" ];
  then params="${params} local_user_level=\"${PT_local_user_level}\""
fi

if [ ! -z "${PT_radius_server_ip+x}" ];
  then params="${params} radius_server_ip=\"${PT_radius_server_ip}\""
fi

if [ ! -z "${PT_local_ftp_dir+x}" ];
  then params="${params} local_ftp_dir=\"${PT_local_ftp_dir}\""
fi

if [ ! -z "${PT_hwtacacs_vpn_name+x}" ];
  then params="${params} hwtacacs_vpn_name=\"${PT_hwtacacs_vpn_name}\""
fi

if [ ! -z "${PT_hwtacacs_is_secondary_server+x}" ];
  then params="${params} hwtacacs_is_secondary_server=\"${PT_hwtacacs_is_secondary_server}\""
fi

if [ ! -z "${PT_radius_group_name+x}" ];
  then params="${params} radius_group_name=\"${PT_radius_group_name}\""
fi

if [ ! -z "${PT_hwtacacs_template+x}" ];
  then params="${params} hwtacacs_template=\"${PT_hwtacacs_template}\""
fi

if [ ! -z "${PT_local_password+x}" ];
  then params="${params} local_password=\"${PT_local_password}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_hwtacacs_server_host_name+x}" ];
  then params="${params} hwtacacs_server_host_name=\"${PT_hwtacacs_server_host_name}\""
fi

if [ ! -z "${PT_local_user_name+x}" ];
  then params="${params} local_user_name=\"${PT_local_user_name}\""
fi

if [ ! -z "${PT_hwtacacs_is_public_net+x}" ];
  then params="${params} hwtacacs_is_public_net=\"${PT_hwtacacs_is_public_net}\""
fi

ansible localhost -m ce_aaa_server_host --args "${params}" --one-line | cut -f2- -d">"