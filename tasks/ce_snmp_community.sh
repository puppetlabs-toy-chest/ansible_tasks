#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_notify_view+x}" ];
  then params="${params} notify_view=\"${PT_notify_view}\""
fi

if [ ! -z "${PT_community_name+x}" ];
  then params="${params} community_name=\"${PT_community_name}\""
fi

if [ ! -z "${PT_community_mib_view+x}" ];
  then params="${params} community_mib_view=\"${PT_community_mib_view}\""
fi

if [ ! -z "${PT_read_view+x}" ];
  then params="${params} read_view=\"${PT_read_view}\""
fi

if [ ! -z "${PT_acl_number+x}" ];
  then params="${params} acl_number=\"${PT_acl_number}\""
fi

if [ ! -z "${PT_group_name+x}" ];
  then params="${params} group_name=\"${PT_group_name}\""
fi

if [ ! -z "${PT_write_view+x}" ];
  then params="${params} write_view=\"${PT_write_view}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_security_level+x}" ];
  then params="${params} security_level=\"${PT_security_level}\""
fi

if [ ! -z "${PT_access_right+x}" ];
  then params="${params} access_right=\"${PT_access_right}\""
fi

ansible localhost -m ce_snmp_community --args "${params}" --one-line | cut -f2- -d">"