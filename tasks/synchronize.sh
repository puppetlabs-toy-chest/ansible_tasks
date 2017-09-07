#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_dirs+x}" ];
  then params="${params} dirs=\"${PT_dirs}\""
fi

if [ ! -z "${PT_partial+x}" ];
  then params="${params} partial=\"${PT_partial}\""
fi

if [ ! -z "${PT_links+x}" ];
  then params="${params} links=\"${PT_links}\""
fi

if [ ! -z "${PT_copy_links+x}" ];
  then params="${params} copy_links=\"${PT_copy_links}\""
fi

if [ ! -z "${PT_perms+x}" ];
  then params="${params} perms=\"${PT_perms}\""
fi

if [ ! -z "${PT_compress+x}" ];
  then params="${params} compress=\"${PT_compress}\""
fi

if [ ! -z "${PT_rsync_timeout+x}" ];
  then params="${params} rsync_timeout=\"${PT_rsync_timeout}\""
fi

if [ ! -z "${PT_rsync_opts+x}" ];
  then params="${params} rsync_opts=\"${PT_rsync_opts}\""
fi

if [ ! -z "${PT_owner+x}" ];
  then params="${params} owner=\"${PT_owner}\""
fi

if [ ! -z "${PT_set_remote_user+x}" ];
  then params="${params} set_remote_user=\"${PT_set_remote_user}\""
fi

if [ ! -z "${PT_times+x}" ];
  then params="${params} times=\"${PT_times}\""
fi

if [ ! -z "${PT_rsync_path+x}" ];
  then params="${params} rsync_path=\"${PT_rsync_path}\""
fi

if [ ! -z "${PT_dest_port+x}" ];
  then params="${params} dest_port=\"${PT_dest_port}\""
fi

if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_group+x}" ];
  then params="${params} group=\"${PT_group}\""
fi

if [ ! -z "${PT_existing_only+x}" ];
  then params="${params} existing_only=\"${PT_existing_only}\""
fi

if [ ! -z "${PT_recursive+x}" ];
  then params="${params} recursive=\"${PT_recursive}\""
fi

if [ ! -z "${PT_archive+x}" ];
  then params="${params} archive=\"${PT_archive}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_mode+x}" ];
  then params="${params} mode=\"${PT_mode}\""
fi

if [ ! -z "${PT_checksum+x}" ];
  then params="${params} checksum=\"${PT_checksum}\""
fi

if [ ! -z "${PT_verify_host+x}" ];
  then params="${params} verify_host=\"${PT_verify_host}\""
fi

if [ ! -z "${PT_use_ssh_args+x}" ];
  then params="${params} use_ssh_args=\"${PT_use_ssh_args}\""
fi

if [ ! -z "${PT_delete+x}" ];
  then params="${params} delete=\"${PT_delete}\""
fi

ansible localhost -m synchronize --args "${params}" --one-line | cut -f2- -d">"