#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_prefix+x}" ];
  then params="${params} prefix=\"${PT_prefix}\""
fi

if [ ! -z "${PT_aftype+x}" ];
  then params="${params} aftype=\"${PT_aftype}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_pref+x}" ];
  then params="${params} pref=\"${PT_pref}\""
fi

if [ ! -z "${PT_mask+x}" ];
  then params="${params} mask=\"${PT_mask}\""
fi

if [ ! -z "${PT_destvrf+x}" ];
  then params="${params} destvrf=\"${PT_destvrf}\""
fi

if [ ! -z "${PT_nhp_interface+x}" ];
  then params="${params} nhp_interface=\"${PT_nhp_interface}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_next_hop+x}" ];
  then params="${params} next_hop=\"${PT_next_hop}\""
fi

if [ ! -z "${PT_vrf+x}" ];
  then params="${params} vrf=\"${PT_vrf}\""
fi

if [ ! -z "${PT_tag+x}" ];
  then params="${params} tag=\"${PT_tag}\""
fi

ansible localhost -m ce_static_route --args "${params}" --one-line | cut -f2- -d">"