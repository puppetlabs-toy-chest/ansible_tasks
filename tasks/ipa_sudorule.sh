#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_cn+x}" ];
  then params="${params} cn=\"${PT_cn}\""
fi

if [ ! -z "${PT_hostcategory+x}" ];
  then params="${params} hostcategory=\"${PT_hostcategory}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_usergroup+x}" ];
  then params="${params} usergroup=\"${PT_usergroup}\""
fi

if [ ! -z "${PT_cmdcategory+x}" ];
  then params="${params} cmdcategory=\"${PT_cmdcategory}\""
fi

if [ ! -z "${PT_ipa_port+x}" ];
  then params="${params} ipa_port=\"${PT_ipa_port}\""
fi

if [ ! -z "${PT_cmd+x}" ];
  then params="${params} cmd=\"${PT_cmd}\""
fi

if [ ! -z "${PT_ipa_prot+x}" ];
  then params="${params} ipa_prot=\"${PT_ipa_prot}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_hostgroup+x}" ];
  then params="${params} hostgroup=\"${PT_hostgroup}\""
fi

if [ ! -z "${PT_usercategory+x}" ];
  then params="${params} usercategory=\"${PT_usercategory}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_ipa_user+x}" ];
  then params="${params} ipa_user=\"${PT_ipa_user}\""
fi

if [ ! -z "${PT_ipa_pass+x}" ];
  then params="${params} ipa_pass=\"${PT_ipa_pass}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_ipa_host+x}" ];
  then params="${params} ipa_host=\"${PT_ipa_host}\""
fi

ansible localhost -m ipa_sudorule --args "${params}" --one-line | cut -f2- -d">"