#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_authorize+x}" ];
  then params="${params} authorize=\"${PT_authorize}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_tower_host+x}" ];
  then params="${params} tower_host=\"${PT_tower_host}\""
fi

if [ ! -z "${PT_vault_password+x}" ];
  then params="${params} vault_password=\"${PT_vault_password}\""
fi

if [ ! -z "${PT_team+x}" ];
  then params="${params} team=\"${PT_team}\""
fi

if [ ! -z "${PT_tower_config_file+x}" ];
  then params="${params} tower_config_file=\"${PT_tower_config_file}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_become_password+x}" ];
  then params="${params} become_password=\"${PT_become_password}\""
fi

if [ ! -z "${PT_tower_password+x}" ];
  then params="${params} tower_password=\"${PT_tower_password}\""
fi

if [ ! -z "${PT_tower_username+x}" ];
  then params="${params} tower_username=\"${PT_tower_username}\""
fi

if [ ! -z "${PT_become_username+x}" ];
  then params="${params} become_username=\"${PT_become_username}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_subscription+x}" ];
  then params="${params} subscription=\"${PT_subscription}\""
fi

if [ ! -z "${PT_kind+x}" ];
  then params="${params} kind=\"${PT_kind}\""
fi

if [ ! -z "${PT_become_method+x}" ];
  then params="${params} become_method=\"${PT_become_method}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_tower_verify_ssl+x}" ];
  then params="${params} tower_verify_ssl=\"${PT_tower_verify_ssl}\""
fi

if [ ! -z "${PT_secret+x}" ];
  then params="${params} secret=\"${PT_secret}\""
fi

if [ ! -z "${PT_project+x}" ];
  then params="${params} project=\"${PT_project}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_client+x}" ];
  then params="${params} client=\"${PT_client}\""
fi

if [ ! -z "${PT_ssh_key_data+x}" ];
  then params="${params} ssh_key_data=\"${PT_ssh_key_data}\""
fi

if [ ! -z "${PT_ssh_key_unlock+x}" ];
  then params="${params} ssh_key_unlock=\"${PT_ssh_key_unlock}\""
fi

if [ ! -z "${PT_organization+x}" ];
  then params="${params} organization=\"${PT_organization}\""
fi

if [ ! -z "${PT_authorize_password+x}" ];
  then params="${params} authorize_password=\"${PT_authorize_password}\""
fi

ansible localhost -m tower_credential --args "${params}" --one-line | cut -f2- -d">"