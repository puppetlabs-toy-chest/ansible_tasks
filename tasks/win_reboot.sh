#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_test_command+x}" ];
  then params="${params} test_command=\"${PT_test_command}\""
fi

if [ ! -z "${PT_connect_timeout_sec+x}" ];
  then params="${params} connect_timeout_sec=\"${PT_connect_timeout_sec}\""
fi

if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_pre_reboot_delay_sec+x}" ];
  then params="${params} pre_reboot_delay_sec=\"${PT_pre_reboot_delay_sec}\""
fi

if [ ! -z "${PT_shutdown_timeout_sec+x}" ];
  then params="${params} shutdown_timeout_sec=\"${PT_shutdown_timeout_sec}\""
fi

if [ ! -z "${PT_reboot_timeout_sec+x}" ];
  then params="${params} reboot_timeout_sec=\"${PT_reboot_timeout_sec}\""
fi

ansible localhost -m win_reboot --args "${params}" --one-line | cut -f2- -d">"