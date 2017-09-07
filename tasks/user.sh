#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_ssh_key_bits+x}" ];
  then params="${params} ssh_key_bits=\"${PT_ssh_key_bits}\""
fi

if [ ! -z "${PT_update_password+x}" ];
  then params="${params} update_password=\"${PT_update_password}\""
fi

if [ ! -z "${PT_non_unique+x}" ];
  then params="${params} non_unique=\"${PT_non_unique}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_ssh_key_type+x}" ];
  then params="${params} ssh_key_type=\"${PT_ssh_key_type}\""
fi

if [ ! -z "${PT_expires+x}" ];
  then params="${params} expires=\"${PT_expires}\""
fi

if [ ! -z "${PT_ssh_key_passphrase+x}" ];
  then params="${params} ssh_key_passphrase=\"${PT_ssh_key_passphrase}\""
fi

if [ ! -z "${PT_groups+x}" ];
  then params="${params} groups=\"${PT_groups}\""
fi

if [ ! -z "${PT_home+x}" ];
  then params="${params} home=\"${PT_home}\""
fi

if [ ! -z "${PT_move_home+x}" ];
  then params="${params} move_home=\"${PT_move_home}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_skeleton+x}" ];
  then params="${params} skeleton=\"${PT_skeleton}\""
fi

if [ ! -z "${PT_generate_ssh_key+x}" ];
  then params="${params} generate_ssh_key=\"${PT_generate_ssh_key}\""
fi

if [ ! -z "${PT_append+x}" ];
  then params="${params} append=\"${PT_append}\""
fi

if [ ! -z "${PT_uid+x}" ];
  then params="${params} uid=\"${PT_uid}\""
fi

if [ ! -z "${PT_ssh_key_comment+x}" ];
  then params="${params} ssh_key_comment=\"${PT_ssh_key_comment}\""
fi

if [ ! -z "${PT_group+x}" ];
  then params="${params} group=\"${PT_group}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_createhome+x}" ];
  then params="${params} createhome=\"${PT_createhome}\""
fi

if [ ! -z "${PT_system+x}" ];
  then params="${params} system=\"${PT_system}\""
fi

if [ ! -z "${PT_remove+x}" ];
  then params="${params} remove=\"${PT_remove}\""
fi

if [ ! -z "${PT_seuser+x}" ];
  then params="${params} seuser=\"${PT_seuser}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_ssh_key_file+x}" ];
  then params="${params} ssh_key_file=\"${PT_ssh_key_file}\""
fi

if [ ! -z "${PT_login_class+x}" ];
  then params="${params} login_class=\"${PT_login_class}\""
fi

if [ ! -z "${PT_shell+x}" ];
  then params="${params} shell=\"${PT_shell}\""
fi

ansible localhost -m user --args "${params}" --one-line | cut -f2- -d">"