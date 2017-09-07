#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_ns_os_version+x}" ];
  then params="${params} ns_os_version=\"${PT_ns_os_version}\""
fi

if [ ! -z "${PT_ipa_host+x}" ];
  then params="${params} ipa_host=\"${PT_ipa_host}\""
fi

if [ ! -z "${PT_ip_address+x}" ];
  then params="${params} ip_address=\"${PT_ip_address}\""
fi

if [ ! -z "${PT_ns_hardware_platform+x}" ];
  then params="${params} ns_hardware_platform=\"${PT_ns_hardware_platform}\""
fi

if [ ! -z "${PT_ns_host_location+x}" ];
  then params="${params} ns_host_location=\"${PT_ns_host_location}\""
fi

if [ ! -z "${PT_ipa_port+x}" ];
  then params="${params} ipa_port=\"${PT_ipa_port}\""
fi

if [ ! -z "${PT_user_certificate+x}" ];
  then params="${params} user_certificate=\"${PT_user_certificate}\""
fi

if [ ! -z "${PT_ipa_prot+x}" ];
  then params="${params} ipa_prot=\"${PT_ipa_prot}\""
fi

if [ ! -z "${PT_fqdn+x}" ];
  then params="${params} fqdn=\"${PT_fqdn}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_ipa_user+x}" ];
  then params="${params} ipa_user=\"${PT_ipa_user}\""
fi

if [ ! -z "${PT_mac_address+x}" ];
  then params="${params} mac_address=\"${PT_mac_address}\""
fi

if [ ! -z "${PT_ipa_pass+x}" ];
  then params="${params} ipa_pass=\"${PT_ipa_pass}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m ipa_host --args "${params}" --one-line | cut -f2- -d">"