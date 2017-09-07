#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_vmhost+x}" ];
  then params="${params} vmhost=\"${PT_vmhost}\""
fi

if [ ! -z "${PT_vmmem+x}" ];
  then params="${params} vmmem=\"${PT_vmmem}\""
fi

if [ ! -z "${PT_cd_drive+x}" ];
  then params="${params} cd_drive=\"${PT_cd_drive}\""
fi

if [ ! -z "${PT_image+x}" ];
  then params="${params} image=\"${PT_image}\""
fi

if [ ! -z "${PT_cpu_share+x}" ];
  then params="${params} cpu_share=\"${PT_cpu_share}\""
fi

if [ ! -z "${PT_insecure_api+x}" ];
  then params="${params} insecure_api=\"${PT_insecure_api}\""
fi

if [ ! -z "${PT_cluster+x}" ];
  then params="${params} cluster=\"${PT_cluster}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_vm_ha+x}" ];
  then params="${params} vm_ha=\"${PT_vm_ha}\""
fi

if [ ! -z "${PT_disks+x}" ];
  then params="${params} disks=\"${PT_disks}\""
fi

if [ ! -z "${PT_datacenter+x}" ];
  then params="${params} datacenter=\"${PT_datacenter}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_ifaces+x}" ];
  then params="${params} ifaces=\"${PT_ifaces}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_osver+x}" ];
  then params="${params} osver=\"${PT_osver}\""
fi

if [ ! -z "${PT_mempol+x}" ];
  then params="${params} mempol=\"${PT_mempol}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_del_prot+x}" ];
  then params="${params} del_prot=\"${PT_del_prot}\""
fi

if [ ! -z "${PT_boot_order+x}" ];
  then params="${params} boot_order=\"${PT_boot_order}\""
fi

if [ ! -z "${PT_type+x}" ];
  then params="${params} type=\"${PT_type}\""
fi

if [ ! -z "${PT_vmcpu+x}" ];
  then params="${params} vmcpu=\"${PT_vmcpu}\""
fi

ansible localhost -m rhevm --args "${params}" --one-line | cut -f2- -d">"