#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_outputfile+x}" ];
  then params="${params} outputfile=\"${PT_outputfile}\""
fi

if [ ! -z "${PT_deviceType+x}" ];
  then params="${params} deviceType=\"${PT_deviceType}\""
fi

if [ ! -z "${PT_vlagArg2+x}" ];
  then params="${params} vlagArg2=\"${PT_vlagArg2}\""
fi

if [ ! -z "${PT_vlagArg3+x}" ];
  then params="${params} vlagArg3=\"${PT_vlagArg3}\""
fi

if [ ! -z "${PT_vlagArg1+x}" ];
  then params="${params} vlagArg1=\"${PT_vlagArg1}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_enablePassword+x}" ];
  then params="${params} enablePassword=\"${PT_enablePassword}\""
fi

if [ ! -z "${PT_vlagArg4+x}" ];
  then params="${params} vlagArg4=\"${PT_vlagArg4}\""
fi

ansible localhost -m cnos_vlag --args "${params}" --one-line | cut -f2- -d">"