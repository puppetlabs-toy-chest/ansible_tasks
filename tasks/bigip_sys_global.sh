#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_security_banner+x}" ];
  then params="${params} security_banner=\"${PT_security_banner}\""
fi

if [ ! -z "${PT_net_reboot+x}" ];
  then params="${params} net_reboot=\"${PT_net_reboot}\""
fi

if [ ! -z "${PT_banner_text+x}" ];
  then params="${params} banner_text=\"${PT_banner_text}\""
fi

if [ ! -z "${PT_console_timeout+x}" ];
  then params="${params} console_timeout=\"${PT_console_timeout}\""
fi

if [ ! -z "${PT_quiet_boot+x}" ];
  then params="${params} quiet_boot=\"${PT_quiet_boot}\""
fi

if [ ! -z "${PT_mgmt_dhcp+x}" ];
  then params="${params} mgmt_dhcp=\"${PT_mgmt_dhcp}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_server_port+x}" ];
  then params="${params} server_port=\"${PT_server_port}\""
fi

if [ ! -z "${PT_gui_setup+x}" ];
  then params="${params} gui_setup=\"${PT_gui_setup}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_lcd_display+x}" ];
  then params="${params} lcd_display=\"${PT_lcd_display}\""
fi

ansible localhost -m bigip_sys_global --args "${params}" --one-line | cut -f2- -d">"