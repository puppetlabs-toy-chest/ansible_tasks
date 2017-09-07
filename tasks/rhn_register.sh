#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_systemorgid+x}" ];
  then params="${params} systemorgid=\"${PT_systemorgid}\""
fi

if [ ! -z "${PT_enable_eus+x}" ];
  then params="${params} enable_eus=\"${PT_enable_eus}\""
fi

if [ ! -z "${PT_server_url+x}" ];
  then params="${params} server_url=\"${PT_server_url}\""
fi

if [ ! -z "${PT_channels+x}" ];
  then params="${params} channels=\"${PT_channels}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_sslcacert+x}" ];
  then params="${params} sslcacert=\"${PT_sslcacert}\""
fi

if [ ! -z "${PT_activationkey+x}" ];
  then params="${params} activationkey=\"${PT_activationkey}\""
fi

if [ ! -z "${PT_profilename+x}" ];
  then params="${params} profilename=\"${PT_profilename}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

ansible localhost -m rhn_register --args "${params}" --one-line | cut -f2- -d">"