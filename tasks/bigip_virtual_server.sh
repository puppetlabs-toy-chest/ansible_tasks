#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_route_advertisement_state+x}" ];
  then params="${params} route_advertisement_state=\"${PT_route_advertisement_state}\""
fi

if [ ! -z "${PT_partition+x}" ];
  then params="${params} partition=\"${PT_partition}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_fallback_persistence_profile+x}" ];
  then params="${params} fallback_persistence_profile=\"${PT_fallback_persistence_profile}\""
fi

if [ ! -z "${PT_default_persistence_profile+x}" ];
  then params="${params} default_persistence_profile=\"${PT_default_persistence_profile}\""
fi

if [ ! -z "${PT_all_rules+x}" ];
  then params="${params} all_rules=\"${PT_all_rules}\""
fi

if [ ! -z "${PT_enabled_vlans+x}" ];
  then params="${params} enabled_vlans=\"${PT_enabled_vlans}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_all_policies+x}" ];
  then params="${params} all_policies=\"${PT_all_policies}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_snat+x}" ];
  then params="${params} snat=\"${PT_snat}\""
fi

if [ ! -z "${PT_destination+x}" ];
  then params="${params} destination=\"${PT_destination}\""
fi

if [ ! -z "${PT_all_profiles+x}" ];
  then params="${params} all_profiles=\"${PT_all_profiles}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_pool+x}" ];
  then params="${params} pool=\"${PT_pool}\""
fi

if [ ! -z "${PT_server_port+x}" ];
  then params="${params} server_port=\"${PT_server_port}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m bigip_virtual_server --args "${params}" --one-line | cut -f2- -d">"