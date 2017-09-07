#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_telephonenumber+x}" ];
  then params="${params} telephonenumber=\"${PT_telephonenumber}\""
fi

if [ ! -z "${PT_sshpubkey+x}" ];
  then params="${params} sshpubkey=\"${PT_sshpubkey}\""
fi

if [ ! -z "${PT_displayname+x}" ];
  then params="${params} displayname=\"${PT_displayname}\""
fi

if [ ! -z "${PT_uid+x}" ];
  then params="${params} uid=\"${PT_uid}\""
fi

if [ ! -z "${PT_ipa_host+x}" ];
  then params="${params} ipa_host=\"${PT_ipa_host}\""
fi

if [ ! -z "${PT_givenname+x}" ];
  then params="${params} givenname=\"${PT_givenname}\""
fi

if [ ! -z "${PT_ipa_port+x}" ];
  then params="${params} ipa_port=\"${PT_ipa_port}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_title+x}" ];
  then params="${params} title=\"${PT_title}\""
fi

if [ ! -z "${PT_loginshell+x}" ];
  then params="${params} loginshell=\"${PT_loginshell}\""
fi

if [ ! -z "${PT_ipa_prot+x}" ];
  then params="${params} ipa_prot=\"${PT_ipa_prot}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_sn+x}" ];
  then params="${params} sn=\"${PT_sn}\""
fi

if [ ! -z "${PT_ipa_user+x}" ];
  then params="${params} ipa_user=\"${PT_ipa_user}\""
fi

if [ ! -z "${PT_ipa_pass+x}" ];
  then params="${params} ipa_pass=\"${PT_ipa_pass}\""
fi

if [ ! -z "${PT_mail+x}" ];
  then params="${params} mail=\"${PT_mail}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m ipa_user --args "${params}" --one-line | cut -f2- -d">"