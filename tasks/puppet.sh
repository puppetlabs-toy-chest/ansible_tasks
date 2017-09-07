#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_logdest+x}" ];
  then params="${params} logdest=\"${PT_logdest}\""
fi

if [ ! -z "${PT_execute+x}" ];
  then params="${params} execute=\"${PT_execute}\""
fi

if [ ! -z "${PT_facter_basename+x}" ];
  then params="${params} facter_basename=\"${PT_facter_basename}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_puppetmaster+x}" ];
  then params="${params} puppetmaster=\"${PT_puppetmaster}\""
fi

if [ ! -z "${PT_certname+x}" ];
  then params="${params} certname=\"${PT_certname}\""
fi

if [ ! -z "${PT_manifest+x}" ];
  then params="${params} manifest=\"${PT_manifest}\""
fi

if [ ! -z "${PT_environment+x}" ];
  then params="${params} environment=\"${PT_environment}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_facts+x}" ];
  then params="${params} facts=\"${PT_facts}\""
fi

if [ ! -z "${PT_modulepath+x}" ];
  then params="${params} modulepath=\"${PT_modulepath}\""
fi

ansible localhost -m puppet --args "${params}" --one-line | cut -f2- -d">"