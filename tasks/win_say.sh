#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_end_sound_path+x}" ];
  then params="${params} end_sound_path=\"${PT_end_sound_path}\""
fi

if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_start_sound_path+x}" ];
  then params="${params} start_sound_path=\"${PT_start_sound_path}\""
fi

if [ ! -z "${PT_voice+x}" ];
  then params="${params} voice=\"${PT_voice}\""
fi

if [ ! -z "${PT_msg_file+x}" ];
  then params="${params} msg_file=\"${PT_msg_file}\""
fi

if [ ! -z "${PT_speech_speed+x}" ];
  then params="${params} speech_speed=\"${PT_speech_speed}\""
fi

ansible localhost -m win_say --args "${params}" --one-line | cut -f2- -d">"