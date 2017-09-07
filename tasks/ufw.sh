#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_direction+x}" ];
  then params="${params} direction=\"${PT_direction}\""
fi

if [ ! -z "${PT_from_port+x}" ];
  then params="${params} from_port=\"${PT_from_port}\""
fi

if [ ! -z "${PT_to_ip+x}" ];
  then params="${params} to_ip=\"${PT_to_ip}\""
fi

if [ ! -z "${PT_to_port+x}" ];
  then params="${params} to_port=\"${PT_to_port}\""
fi

if [ ! -z "${PT_from_ip+x}" ];
  then params="${params} from_ip=\"${PT_from_ip}\""
fi

if [ ! -z "${PT_interface+x}" ];
  then params="${params} interface=\"${PT_interface}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_insert+x}" ];
  then params="${params} insert=\"${PT_insert}\""
fi

if [ ! -z "${PT_logging+x}" ];
  then params="${params} logging=\"${PT_logging}\""
fi

if [ ! -z "${PT_log+x}" ];
  then params="${params} log=\"${PT_log}\""
fi

if [ ! -z "${PT_proto+x}" ];
  then params="${params} proto=\"${PT_proto}\""
fi

if [ ! -z "${PT_route+x}" ];
  then params="${params} route=\"${PT_route}\""
fi

if [ ! -z "${PT_rule+x}" ];
  then params="${params} rule=\"${PT_rule}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_policy+x}" ];
  then params="${params} policy=\"${PT_policy}\""
fi

if [ ! -z "${PT_delete+x}" ];
  then params="${params} delete=\"${PT_delete}\""
fi

ansible localhost -m ufw --args "${params}" --one-line | cut -f2- -d">"