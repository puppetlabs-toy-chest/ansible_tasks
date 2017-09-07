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

if [ ! -z "${PT_bgpArg8+x}" ];
  then params="${params} bgpArg8=\"${PT_bgpArg8}\""
fi

if [ ! -z "${PT_asNum+x}" ];
  then params="${params} asNum=\"${PT_asNum}\""
fi

if [ ! -z "${PT_bgpArg4+x}" ];
  then params="${params} bgpArg4=\"${PT_bgpArg4}\""
fi

if [ ! -z "${PT_bgpArg5+x}" ];
  then params="${params} bgpArg5=\"${PT_bgpArg5}\""
fi

if [ ! -z "${PT_bgpArg6+x}" ];
  then params="${params} bgpArg6=\"${PT_bgpArg6}\""
fi

if [ ! -z "${PT_bgpArg7+x}" ];
  then params="${params} bgpArg7=\"${PT_bgpArg7}\""
fi

if [ ! -z "${PT_bgpArg1+x}" ];
  then params="${params} bgpArg1=\"${PT_bgpArg1}\""
fi

if [ ! -z "${PT_bgpArg2+x}" ];
  then params="${params} bgpArg2=\"${PT_bgpArg2}\""
fi

if [ ! -z "${PT_bgpArg3+x}" ];
  then params="${params} bgpArg3=\"${PT_bgpArg3}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_deviceType+x}" ];
  then params="${params} deviceType=\"${PT_deviceType}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_enablePassword+x}" ];
  then params="${params} enablePassword=\"${PT_enablePassword}\""
fi

ansible localhost -m cnos_bgp --args "${params}" --one-line | cut -f2- -d">"