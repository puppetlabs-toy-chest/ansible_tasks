#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_selevel+x}" ];
  then params="${params} selevel=\"${PT_selevel}\""
fi

if [ ! -z "${PT_force_basic_auth+x}" ];
  then params="${params} force_basic_auth=\"${PT_force_basic_auth}\""
fi

if [ ! -z "${PT_sha256sum+x}" ];
  then params="${params} sha256sum=\"${PT_sha256sum}\""
fi

if [ ! -z "${PT_others+x}" ];
  then params="${params} others=\"${PT_others}\""
fi

if [ ! -z "${PT_owner+x}" ];
  then params="${params} owner=\"${PT_owner}\""
fi

if [ ! -z "${PT_client_key+x}" ];
  then params="${params} client_key=\"${PT_client_key}\""
fi

if [ ! -z "${PT_url_password+x}" ];
  then params="${params} url_password=\"${PT_url_password}\""
fi

if [ ! -z "${PT_group+x}" ];
  then params="${params} group=\"${PT_group}\""
fi

if [ ! -z "${PT_use_proxy+x}" ];
  then params="${params} use_proxy=\"${PT_use_proxy}\""
fi

if [ ! -z "${PT_headers+x}" ];
  then params="${params} headers=\"${PT_headers}\""
fi

if [ ! -z "${PT_unsafe_writes+x}" ];
  then params="${params} unsafe_writes=\"${PT_unsafe_writes}\""
fi

if [ ! -z "${PT_checksum+x}" ];
  then params="${params} checksum=\"${PT_checksum}\""
fi

if [ ! -z "${PT_seuser+x}" ];
  then params="${params} seuser=\"${PT_seuser}\""
fi

if [ ! -z "${PT_setype+x}" ];
  then params="${params} setype=\"${PT_setype}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_serole+x}" ];
  then params="${params} serole=\"${PT_serole}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_url_username+x}" ];
  then params="${params} url_username=\"${PT_url_username}\""
fi

if [ ! -z "${PT_attributes+x}" ];
  then params="${params} attributes=\"${PT_attributes}\""
fi

if [ ! -z "${PT_backup+x}" ];
  then params="${params} backup=\"${PT_backup}\""
fi

if [ ! -z "${PT_client_cert+x}" ];
  then params="${params} client_cert=\"${PT_client_cert}\""
fi

if [ ! -z "${PT_tmp_dest+x}" ];
  then params="${params} tmp_dest=\"${PT_tmp_dest}\""
fi

ansible localhost -m get_url --args "${params}" --one-line | cut -f2- -d">"