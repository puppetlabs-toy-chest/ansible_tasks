#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
fi

if [ ! -z "${PT_attachments+x}" ];
  then params="${params} attachments=\"${PT_attachments}\""
fi

if [ ! -z "${PT_color+x}" ];
  then params="${params} color=\"${PT_color}\""
fi

if [ ! -z "${PT_icon_url+x}" ];
  then params="${params} icon_url=\"${PT_icon_url}\""
fi

if [ ! -z "${PT_token+x}" ];
  then params="${params} token=\"${PT_token}\""
fi

if [ ! -z "${PT_icon_emoji+x}" ];
  then params="${params} icon_emoji=\"${PT_icon_emoji}\""
fi

if [ ! -z "${PT_link_names+x}" ];
  then params="${params} link_names=\"${PT_link_names}\""
fi

if [ ! -z "${PT_msg+x}" ];
  then params="${params} msg=\"${PT_msg}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_channel+x}" ];
  then params="${params} channel=\"${PT_channel}\""
fi

ansible localhost -m rocketchat --args "${params}" --one-line | cut -f2- -d">"