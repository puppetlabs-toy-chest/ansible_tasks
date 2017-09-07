#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_snapshot1+x}" ];
  then params="${params} snapshot1=\"${PT_snapshot1}\""
fi

if [ ! -z "${PT_snapshot2+x}" ];
  then params="${params} snapshot2=\"${PT_snapshot2}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_snapshot_name+x}" ];
  then params="${params} snapshot_name=\"${PT_snapshot_name}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_section+x}" ];
  then params="${params} section=\"${PT_section}\""
fi

if [ ! -z "${PT_comparison_results_file+x}" ];
  then params="${params} comparison_results_file=\"${PT_comparison_results_file}\""
fi

if [ ! -z "${PT_show_command+x}" ];
  then params="${params} show_command=\"${PT_show_command}\""
fi

if [ ! -z "${PT_element_key1+x}" ];
  then params="${params} element_key1=\"${PT_element_key1}\""
fi

if [ ! -z "${PT_element_key2+x}" ];
  then params="${params} element_key2=\"${PT_element_key2}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_action+x}" ];
  then params="${params} action=\"${PT_action}\""
fi

if [ ! -z "${PT_row_id+x}" ];
  then params="${params} row_id=\"${PT_row_id}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_save_snapshot_locally+x}" ];
  then params="${params} save_snapshot_locally=\"${PT_save_snapshot_locally}\""
fi

if [ ! -z "${PT_compare_option+x}" ];
  then params="${params} compare_option=\"${PT_compare_option}\""
fi

ansible localhost -m nxos_snapshot --args "${params}" --one-line | cut -f2- -d">"