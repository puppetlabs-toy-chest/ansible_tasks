#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_application_id+x}" ];
  then params="${params} application_id=\"${PT_application_id}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_changelog+x}" ];
  then params="${params} changelog=\"${PT_changelog}\""
fi

if [ ! -z "${PT_appname+x}" ];
  then params="${params} appname=\"${PT_appname}\""
fi

if [ ! -z "${PT_environment+x}" ];
  then params="${params} environment=\"${PT_environment}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_revision+x}" ];
  then params="${params} revision=\"${PT_revision}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_app_name+x}" ];
  then params="${params} app_name=\"${PT_app_name}\""
fi

ansible localhost -m newrelic_deployment --args "${params}" --one-line | cut -f2- -d">"