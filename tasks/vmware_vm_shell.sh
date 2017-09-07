#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_datacenter+x}" ];
  then params="${params} datacenter=\"${PT_datacenter}\""
fi

if [ ! -z "${PT_vm_password+x}" ];
  then params="${params} vm_password=\"${PT_vm_password}\""
fi

if [ ! -z "${PT_vm_shell_cwd+x}" ];
  then params="${params} vm_shell_cwd=\"${PT_vm_shell_cwd}\""
fi

if [ ! -z "${PT_vm_id+x}" ];
  then params="${params} vm_id=\"${PT_vm_id}\""
fi

if [ ! -z "${PT_vm_shell_args+x}" ];
  then params="${params} vm_shell_args=\"${PT_vm_shell_args}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_vm_username+x}" ];
  then params="${params} vm_username=\"${PT_vm_username}\""
fi

if [ ! -z "${PT_vm_shell_env+x}" ];
  then params="${params} vm_shell_env=\"${PT_vm_shell_env}\""
fi

if [ ! -z "${PT_vm_shell+x}" ];
  then params="${params} vm_shell=\"${PT_vm_shell}\""
fi

if [ ! -z "${PT_cluster+x}" ];
  then params="${params} cluster=\"${PT_cluster}\""
fi

if [ ! -z "${PT_vm_id_type+x}" ];
  then params="${params} vm_id_type=\"${PT_vm_id_type}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m vmware_vm_shell --args "${params}" --one-line | cut -f2- -d">"