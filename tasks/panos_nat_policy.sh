#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_snat_bidirectional+x}" ];
  then params="${params} snat_bidirectional=\"${PT_snat_bidirectional}\""
fi

if [ ! -z "${PT_dnat_port+x}" ];
  then params="${params} dnat_port=\"${PT_dnat_port}\""
fi

if [ ! -z "${PT_snat_interface_address+x}" ];
  then params="${params} snat_interface_address=\"${PT_snat_interface_address}\""
fi

if [ ! -z "${PT_rule_name+x}" ];
  then params="${params} rule_name=\"${PT_rule_name}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_ip_address+x}" ];
  then params="${params} ip_address=\"${PT_ip_address}\""
fi

if [ ! -z "${PT_snat_address+x}" ];
  then params="${params} snat_address=\"${PT_snat_address}\""
fi

if [ ! -z "${PT_dnat_address+x}" ];
  then params="${params} dnat_address=\"${PT_dnat_address}\""
fi

if [ ! -z "${PT_to_zone+x}" ];
  then params="${params} to_zone=\"${PT_to_zone}\""
fi

if [ ! -z "${PT_service+x}" ];
  then params="${params} service=\"${PT_service}\""
fi

if [ ! -z "${PT_snat_type+x}" ];
  then params="${params} snat_type=\"${PT_snat_type}\""
fi

if [ ! -z "${PT_destination+x}" ];
  then params="${params} destination=\"${PT_destination}\""
fi

if [ ! -z "${PT_from_zone+x}" ];
  then params="${params} from_zone=\"${PT_from_zone}\""
fi

if [ ! -z "${PT_source+x}" ];
  then params="${params} source=\"${PT_source}\""
fi

if [ ! -z "${PT_override+x}" ];
  then params="${params} override=\"${PT_override}\""
fi

if [ ! -z "${PT_commit+x}" ];
  then params="${params} commit=\"${PT_commit}\""
fi

if [ ! -z "${PT_snat_interface+x}" ];
  then params="${params} snat_interface=\"${PT_snat_interface}\""
fi

ansible localhost -m panos_nat_policy --args "${params}" --one-line | cut -f2- -d">"