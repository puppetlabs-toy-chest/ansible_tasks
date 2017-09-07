#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_subjectAltName+x}" ];
  then params="${params} subjectAltName=\"${PT_subjectAltName}\""
fi

if [ ! -z "${PT_commonName+x}" ];
  then params="${params} commonName=\"${PT_commonName}\""
fi

if [ ! -z "${PT_stateOrProvinceName+x}" ];
  then params="${params} stateOrProvinceName=\"${PT_stateOrProvinceName}\""
fi

if [ ! -z "${PT_privatekey_path+x}" ];
  then params="${params} privatekey_path=\"${PT_privatekey_path}\""
fi

if [ ! -z "${PT_countryName+x}" ];
  then params="${params} countryName=\"${PT_countryName}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_version+x}" ];
  then params="${params} version=\"${PT_version}\""
fi

if [ ! -z "${PT_emailAddress+x}" ];
  then params="${params} emailAddress=\"${PT_emailAddress}\""
fi

if [ ! -z "${PT_digest+x}" ];
  then params="${params} digest=\"${PT_digest}\""
fi

if [ ! -z "${PT_localityName+x}" ];
  then params="${params} localityName=\"${PT_localityName}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_organizationName+x}" ];
  then params="${params} organizationName=\"${PT_organizationName}\""
fi

if [ ! -z "${PT_organizationUnitName+x}" ];
  then params="${params} organizationUnitName=\"${PT_organizationUnitName}\""
fi

ansible localhost -m openssl_csr --args "${params}" --one-line | cut -f2- -d">"