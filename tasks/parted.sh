#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_part_start+x}" ];
  then params="${params} part_start=\"${PT_part_start}\""
fi

if [ ! -z "${PT_part_end+x}" ];
  then params="${params} part_end=\"${PT_part_end}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_align+x}" ];
  then params="${params} align=\"${PT_align}\""
fi

if [ ! -z "${PT_number+x}" ];
  then params="${params} number=\"${PT_number}\""
fi

if [ ! -z "${PT_label+x}" ];
  then params="${params} label=\"${PT_label}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_part_type+x}" ];
  then params="${params} part_type=\"${PT_part_type}\""
fi

if [ ! -z "${PT_flags+x}" ];
  then params="${params} flags=\"${PT_flags}\""
fi

if [ ! -z "${PT_device+x}" ];
  then params="${params} device=\"${PT_device}\""
fi

if [ ! -z "${PT_unit+x}" ];
  then params="${params} unit=\"${PT_unit}\""
fi

ansible localhost -m parted --args "${params}" --one-line | cut -f2- -d">"