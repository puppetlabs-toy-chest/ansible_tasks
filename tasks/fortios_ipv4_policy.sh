#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_application_list+x}" ];
  then params="${params} application_list=\"${PT_application_list}\""
fi

if [ ! -z "${PT_service_negate+x}" ];
  then params="${params} service_negate=\"${PT_service_negate}\""
fi

if [ ! -z "${PT_ips_sensor+x}" ];
  then params="${params} ips_sensor=\"${PT_ips_sensor}\""
fi

if [ ! -z "${PT_backup_filename+x}" ];
  then params="${params} backup_filename=\"${PT_backup_filename}\""
fi

if [ ! -z "${PT_id+x}" ];
  then params="${params} id=\"${PT_id}\""
fi

if [ ! -z "${PT_fixedport+x}" ];
  then params="${params} fixedport=\"${PT_fixedport}\""
fi

if [ ! -z "${PT_src_addr+x}" ];
  then params="${params} src_addr=\"${PT_src_addr}\""
fi

if [ ! -z "${PT_service+x}" ];
  then params="${params} service=\"${PT_service}\""
fi

if [ ! -z "${PT_poolname+x}" ];
  then params="${params} poolname=\"${PT_poolname}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_nat+x}" ];
  then params="${params} nat=\"${PT_nat}\""
fi

if [ ! -z "${PT_src_addr_negate+x}" ];
  then params="${params} src_addr_negate=\"${PT_src_addr_negate}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_config_file+x}" ];
  then params="${params} config_file=\"${PT_config_file}\""
fi

if [ ! -z "${PT_file_mode+x}" ];
  then params="${params} file_mode=\"${PT_file_mode}\""
fi

if [ ! -z "${PT_schedule+x}" ];
  then params="${params} schedule=\"${PT_schedule}\""
fi

if [ ! -z "${PT_src_intf+x}" ];
  then params="${params} src_intf=\"${PT_src_intf}\""
fi

if [ ! -z "${PT_dst_addr_negate+x}" ];
  then params="${params} dst_addr_negate=\"${PT_dst_addr_negate}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_vdom+x}" ];
  then params="${params} vdom=\"${PT_vdom}\""
fi

if [ ! -z "${PT_webfilter_profile+x}" ];
  then params="${params} webfilter_profile=\"${PT_webfilter_profile}\""
fi

if [ ! -z "${PT_logtraffic_start+x}" ];
  then params="${params} logtraffic_start=\"${PT_logtraffic_start}\""
fi

if [ ! -z "${PT_backup_path+x}" ];
  then params="${params} backup_path=\"${PT_backup_path}\""
fi

if [ ! -z "${PT_policy_action+x}" ];
  then params="${params} policy_action=\"${PT_policy_action}\""
fi

if [ ! -z "${PT_dst_intf+x}" ];
  then params="${params} dst_intf=\"${PT_dst_intf}\""
fi

if [ ! -z "${PT_av_profile+x}" ];
  then params="${params} av_profile=\"${PT_av_profile}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_backup+x}" ];
  then params="${params} backup=\"${PT_backup}\""
fi

if [ ! -z "${PT_dst_addr+x}" ];
  then params="${params} dst_addr=\"${PT_dst_addr}\""
fi

if [ ! -z "${PT_logtraffic+x}" ];
  then params="${params} logtraffic=\"${PT_logtraffic}\""
fi

ansible localhost -m fortios_ipv4_policy --args "${params}" --one-line | cut -f2- -d">"