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

if [ ! -z "${PT_interfaceArg7+x}" ];
  then params="${params} interfaceArg7=\"${PT_interfaceArg7}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_deviceType+x}" ];
  then params="${params} deviceType=\"${PT_deviceType}\""
fi

if [ ! -z "${PT_interfaceRange+x}" ];
  then params="${params} interfaceRange=\"${PT_interfaceRange}\""
fi

if [ ! -z "${PT_interfaceArg4+x}" ];
  then params="${params} interfaceArg4=\"${PT_interfaceArg4}\""
fi

if [ ! -z "${PT_interfaceArg5+x}" ];
  then params="${params} interfaceArg5=\"${PT_interfaceArg5}\""
fi

if [ ! -z "${PT_interfaceArg6+x}" ];
  then params="${params} interfaceArg6=\"${PT_interfaceArg6}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_enablePassword+x}" ];
  then params="${params} enablePassword=\"${PT_enablePassword}\""
fi

if [ ! -z "${PT_interfaceArg1+x}" ];
  then params="${params} interfaceArg1=\"${PT_interfaceArg1}\""
fi

if [ ! -z "${PT_interfaceArg2+x}" ];
  then params="${params} interfaceArg2=\"${PT_interfaceArg2}\""
fi

if [ ! -z "${PT_interfaceArg3+x}" ];
  then params="${params} interfaceArg3=\"${PT_interfaceArg3}\""
fi

ansible localhost -m cnos_portchannel --args "${params}" --one-line | cut -f2- -d">"