#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_wildfire_analysis+x}" ];
  then params="${params} wildfire_analysis=\"${PT_wildfire_analysis}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_vulnerability+x}" ];
  then params="${params} vulnerability=\"${PT_vulnerability}\""
fi

if [ ! -z "${PT_devicegroup+x}" ];
  then params="${params} devicegroup=\"${PT_devicegroup}\""
fi

if [ ! -z "${PT_data_filtering+x}" ];
  then params="${params} data_filtering=\"${PT_data_filtering}\""
fi

if [ ! -z "${PT_spyware+x}" ];
  then params="${params} spyware=\"${PT_spyware}\""
fi

if [ ! -z "${PT_hip_profiles+x}" ];
  then params="${params} hip_profiles=\"${PT_hip_profiles}\""
fi

if [ ! -z "${PT_file_blocking+x}" ];
  then params="${params} file_blocking=\"${PT_file_blocking}\""
fi

if [ ! -z "${PT_tag+x}" ];
  then params="${params} tag=\"${PT_tag}\""
fi

if [ ! -z "${PT_antivirus+x}" ];
  then params="${params} antivirus=\"${PT_antivirus}\""
fi

if [ ! -z "${PT_log_start+x}" ];
  then params="${params} log_start=\"${PT_log_start}\""
fi

if [ ! -z "${PT_log_end+x}" ];
  then params="${params} log_end=\"${PT_log_end}\""
fi

if [ ! -z "${PT_url_filtering+x}" ];
  then params="${params} url_filtering=\"${PT_url_filtering}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_ip_address+x}" ];
  then params="${params} ip_address=\"${PT_ip_address}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_rule_type+x}" ];
  then params="${params} rule_type=\"${PT_rule_type}\""
fi

if [ ! -z "${PT_rule_name+x}" ];
  then params="${params} rule_name=\"${PT_rule_name}\""
fi

if [ ! -z "${PT_to_zone+x}" ];
  then params="${params} to_zone=\"${PT_to_zone}\""
fi

if [ ! -z "${PT_service+x}" ];
  then params="${params} service=\"${PT_service}\""
fi

if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_destination+x}" ];
  then params="${params} destination=\"${PT_destination}\""
fi

if [ ! -z "${PT_from_zone+x}" ];
  then params="${params} from_zone=\"${PT_from_zone}\""
fi

if [ ! -z "${PT_source_user+x}" ];
  then params="${params} source_user=\"${PT_source_user}\""
fi

if [ ! -z "${PT_application+x}" ];
  then params="${params} application=\"${PT_application}\""
fi

if [ ! -z "${PT_group_profile+x}" ];
  then params="${params} group_profile=\"${PT_group_profile}\""
fi

if [ ! -z "${PT_action+x}" ];
  then params="${params} action=\"${PT_action}\""
fi

if [ ! -z "${PT_commit+x}" ];
  then params="${params} commit=\"${PT_commit}\""
fi

if [ ! -z "${PT_api_key+x}" ];
  then params="${params} api_key=\"${PT_api_key}\""
fi

ansible localhost -m panos_security_policy --args "${params}" --one-line | cut -f2- -d">"