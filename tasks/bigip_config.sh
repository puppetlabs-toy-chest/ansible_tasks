#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_reset+x}" ];
  then params="${params} reset=\"${PT_reset}\""
fi

if [ ! -z "${PT_save+x}" ];
  then params="${params} save=\"${PT_save}\""
fi

if [ ! -z "${PT_merge_content+x}" ];
  then params="${params} merge_content=\"${PT_merge_content}\""
fi

if [ ! -z "${PT_verify+x}" ];
  then params="${params} verify=\"${PT_verify}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_server_port+x}" ];
  then params="${params} server_port=\"${PT_server_port}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m bigip_config --args "${params}" --one-line | cut -f2- -d">"