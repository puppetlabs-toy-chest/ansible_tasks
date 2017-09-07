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

if [ ! -z "${PT_serverip+x}" ];
  then params="${params} serverip=\"${PT_serverip}\""
fi

if [ ! -z "${PT_imgpath+x}" ];
  then params="${params} imgpath=\"${PT_imgpath}\""
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

if [ ! -z "${PT_imgtype+x}" ];
  then params="${params} imgtype=\"${PT_imgtype}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_enablePassword+x}" ];
  then params="${params} enablePassword=\"${PT_enablePassword}\""
fi

ansible localhost -m cnos_image --args "${params}" --one-line | cut -f2- -d">"