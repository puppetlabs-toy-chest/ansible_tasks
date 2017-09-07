#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_subdomains+x}" ];
  then params="${params} subdomains=\"${PT_subdomains}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_https+x}" ];
  then params="${params} https=\"${PT_https}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_login_name+x}" ];
  then params="${params} login_name=\"${PT_login_name}\""
fi

if [ ! -z "${PT_site_apps+x}" ];
  then params="${params} site_apps=\"${PT_site_apps}\""
fi

ansible localhost -m webfaction_site --args "${params}" --one-line | cut -f2- -d">"