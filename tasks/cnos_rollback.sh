#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_serverpassword+x}" ];
  then params="${params} serverpassword=\"${PT_serverpassword}\""
fi

if [ ! -z "${PT_outputfile+x}" ];
  then params="${params} outputfile=\"${PT_outputfile}\""
fi

if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
fi

if [ ! -z "${PT_configType+x}" ];
  then params="${params} configType=\"${PT_configType}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_deviceType+x}" ];
  then params="${params} deviceType=\"${PT_deviceType}\""
fi

if [ ! -z "${PT_serverusername+x}" ];
  then params="${params} serverusername=\"${PT_serverusername}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_enablePassword+x}" ];
  then params="${params} enablePassword=\"${PT_enablePassword}\""
fi

if [ ! -z "${PT_rcserverip+x}" ];
  then params="${params} rcserverip=\"${PT_rcserverip}\""
fi

if [ ! -z "${PT_rcpath+x}" ];
  then params="${params} rcpath=\"${PT_rcpath}\""
fi

ansible localhost -m cnos_rollback --args "${params}" --one-line | cut -f2- -d">"