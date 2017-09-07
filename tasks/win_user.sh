#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_update_password+x}" ];
  then params="${params} update_password=\"${PT_update_password}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_groups_action+x}" ];
  then params="${params} groups_action=\"${PT_groups_action}\""
fi

if [ ! -z "${PT_password_expired+x}" ];
  then params="${params} password_expired=\"${PT_password_expired}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_groups+x}" ];
  then params="${params} groups=\"${PT_groups}\""
fi

if [ ! -z "${PT_account_disabled+x}" ];
  then params="${params} account_disabled=\"${PT_account_disabled}\""
fi

if [ ! -z "${PT_fullname+x}" ];
  then params="${params} fullname=\"${PT_fullname}\""
fi

if [ ! -z "${PT_password_never_expires+x}" ];
  then params="${params} password_never_expires=\"${PT_password_never_expires}\""
fi

if [ ! -z "${PT_account_locked+x}" ];
  then params="${params} account_locked=\"${PT_account_locked}\""
fi

if [ ! -z "${PT_user_cannot_change_password+x}" ];
  then params="${params} user_cannot_change_password=\"${PT_user_cannot_change_password}\""
fi

ansible localhost -m win_user --args "${params}" --one-line | cut -f2- -d">"