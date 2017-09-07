#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_role_size+x}" ];
  then params="${params} role_size=\"${PT_role_size}\""
fi

if [ ! -z "${PT_virtual_network_name+x}" ];
  then params="${params} virtual_network_name=\"${PT_virtual_network_name}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_wait_timeout_redirects+x}" ];
  then params="${params} wait_timeout_redirects=\"${PT_wait_timeout_redirects}\""
fi

if [ ! -z "${PT_wait_timeout+x}" ];
  then params="${params} wait_timeout=\"${PT_wait_timeout}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_auto_updates+x}" ];
  then params="${params} auto_updates=\"${PT_auto_updates}\""
fi

if [ ! -z "${PT_storage_account+x}" ];
  then params="${params} storage_account=\"${PT_storage_account}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_os_type+x}" ];
  then params="${params} os_type=\"${PT_os_type}\""
fi

if [ ! -z "${PT_wait+x}" ];
  then params="${params} wait=\"${PT_wait}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_management_cert_path+x}" ];
  then params="${params} management_cert_path=\"${PT_management_cert_path}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_ssh_cert_path+x}" ];
  then params="${params} ssh_cert_path=\"${PT_ssh_cert_path}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_location+x}" ];
  then params="${params} location=\"${PT_location}\""
fi

if [ ! -z "${PT_subscription_id+x}" ];
  then params="${params} subscription_id=\"${PT_subscription_id}\""
fi

if [ ! -z "${PT_endpoints+x}" ];
  then params="${params} endpoints=\"${PT_endpoints}\""
fi

if [ ! -z "${PT_enable_winrm+x}" ];
  then params="${params} enable_winrm=\"${PT_enable_winrm}\""
fi

ansible localhost -m azure --args "${params}" --one-line | cut -f2- -d">"