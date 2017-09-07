#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_outputfile+x}" ];
  then params="${params} outputfile=\"${PT_outputfile}\""
fi

if [ ! -z "${PT_vlanArg5+x}" ];
  then params="${params} vlanArg5=\"${PT_vlanArg5}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_vlanArg4+x}" ];
  then params="${params} vlanArg4=\"${PT_vlanArg4}\""
fi

if [ ! -z "${PT_deviceType+x}" ];
  then params="${params} deviceType=\"${PT_deviceType}\""
fi

if [ ! -z "${PT_vlanArg2+x}" ];
  then params="${params} vlanArg2=\"${PT_vlanArg2}\""
fi

if [ ! -z "${PT_vlanArg1+x}" ];
  then params="${params} vlanArg1=\"${PT_vlanArg1}\""
fi

if [ ! -z "${PT_vlanArg3+x}" ];
  then params="${params} vlanArg3=\"${PT_vlanArg3}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_enablePassword+x}" ];
  then params="${params} enablePassword=\"${PT_enablePassword}\""
fi

ansible localhost -m cnos_vlan --args "${params}" --one-line | cut -f2- -d">"