#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_xml+x}" ];
  then params="${params} xml=\"${PT_xml}\""
fi

if [ ! -z "${PT_save+x}" ];
  then params="${params} save=\"${PT_save}\""
fi

if [ ! -z "${PT_allow_agent+x}" ];
  then params="${params} allow_agent=\"${PT_allow_agent}\""
fi

if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_look_for_keys+x}" ];
  then params="${params} look_for_keys=\"${PT_look_for_keys}\""
fi

if [ ! -z "${PT_hostkey_verify+x}" ];
  then params="${params} hostkey_verify=\"${PT_hostkey_verify}\""
fi

if [ ! -z "${PT_datastore+x}" ];
  then params="${params} datastore=\"${PT_datastore}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

ansible localhost -m netconf_config --args "${params}" --one-line | cut -f2- -d">"