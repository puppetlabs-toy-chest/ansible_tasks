#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_lsaostartinterval+x}" ];
  then params="${params} lsaostartinterval=\"${PT_lsaostartinterval}\""
fi

if [ ! -z "${PT_lsaastartinterval+x}" ];
  then params="${params} lsaastartinterval=\"${PT_lsaastartinterval}\""
fi

if [ ! -z "${PT_lsaointerval+x}" ];
  then params="${params} lsaointerval=\"${PT_lsaointerval}\""
fi

if [ ! -z "${PT_bandwidth+x}" ];
  then params="${params} bandwidth=\"${PT_bandwidth}\""
fi

if [ ! -z "${PT_spfintervalmi+x}" ];
  then params="${params} spfintervalmi=\"${PT_spfintervalmi}\""
fi

if [ ! -z "${PT_spfinterval+x}" ];
  then params="${params} spfinterval=\"${PT_spfinterval}\""
fi

if [ ! -z "${PT_lsaointervalflag+x}" ];
  then params="${params} lsaointervalflag=\"${PT_lsaointervalflag}\""
fi

if [ ! -z "${PT_lsaomaxinterval+x}" ];
  then params="${params} lsaomaxinterval=\"${PT_lsaomaxinterval}\""
fi

if [ ! -z "${PT_lsaalflag+x}" ];
  then params="${params} lsaalflag=\"${PT_lsaalflag}\""
fi

if [ ! -z "${PT_lsaamaxinterval+x}" ];
  then params="${params} lsaamaxinterval=\"${PT_lsaamaxinterval}\""
fi

if [ ! -z "${PT_lsaoholdinterval+x}" ];
  then params="${params} lsaoholdinterval=\"${PT_lsaoholdinterval}\""
fi

if [ ! -z "${PT_spfintervaltype+x}" ];
  then params="${params} spfintervaltype=\"${PT_spfintervaltype}\""
fi

if [ ! -z "${PT_lsaainterval+x}" ];
  then params="${params} lsaainterval=\"${PT_lsaainterval}\""
fi

if [ ! -z "${PT_spfstartinterval+x}" ];
  then params="${params} spfstartinterval=\"${PT_spfstartinterval}\""
fi

if [ ! -z "${PT_route_id+x}" ];
  then params="${params} route_id=\"${PT_route_id}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_spfmaxinterval+x}" ];
  then params="${params} spfmaxinterval=\"${PT_spfmaxinterval}\""
fi

if [ ! -z "${PT_spfholdinterval+x}" ];
  then params="${params} spfholdinterval=\"${PT_spfholdinterval}\""
fi

if [ ! -z "${PT_lsaaholdinterval+x}" ];
  then params="${params} lsaaholdinterval=\"${PT_lsaaholdinterval}\""
fi

if [ ! -z "${PT_ospf+x}" ];
  then params="${params} ospf=\"${PT_ospf}\""
fi

if [ ! -z "${PT_vrf+x}" ];
  then params="${params} vrf=\"${PT_vrf}\""
fi

ansible localhost -m ce_ospf_vrf --args "${params}" --one-line | cut -f2- -d">"