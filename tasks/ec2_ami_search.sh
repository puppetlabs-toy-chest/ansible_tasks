#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_stream+x}" ];
  then params="${params} stream=\"${PT_stream}\""
fi

if [ ! -z "${PT_release+x}" ];
  then params="${params} release=\"${PT_release}\""
fi

if [ ! -z "${PT_virt+x}" ];
  then params="${params} virt=\"${PT_virt}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_arch+x}" ];
  then params="${params} arch=\"${PT_arch}\""
fi

if [ ! -z "${PT_store+x}" ];
  then params="${params} store=\"${PT_store}\""
fi

if [ ! -z "${PT_distro+x}" ];
  then params="${params} distro=\"${PT_distro}\""
fi

ansible localhost -m ec2_ami_search --args "${params}" --one-line | cut -f2- -d">"