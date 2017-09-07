#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_workgroup_name+x}" ];
  then params="${params} workgroup_name=\"${PT_workgroup_name}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_domain_admin_user+x}" ];
  then params="${params} domain_admin_user=\"${PT_domain_admin_user}\""
fi

if [ ! -z "${PT_dns_domain_name+x}" ];
  then params="${params} dns_domain_name=\"${PT_dns_domain_name}\""
fi

if [ ! -z "${PT_hostname+x}" ];
  then params="${params} hostname=\"${PT_hostname}\""
fi

if [ ! -z "${PT_domain_admin_password+x}" ];
  then params="${params} domain_admin_password=\"${PT_domain_admin_password}\""
fi

ansible localhost -m win_domain_membership --args "${params}" --one-line | cut -f2- -d">"