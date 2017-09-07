#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_archive_path+x}" ];
  then params="${params} archive_path=\"${PT_archive_path}\""
fi

if [ ! -z "${PT_zfs_root+x}" ];
  then params="${params} zfs_root=\"${PT_zfs_root}\""
fi

if [ ! -z "${PT_container_log_level+x}" ];
  then params="${params} container_log_level=\"${PT_container_log_level}\""
fi

if [ ! -z "${PT_template_options+x}" ];
  then params="${params} template_options=\"${PT_template_options}\""
fi

if [ ! -z "${PT_container_command+x}" ];
  then params="${params} container_command=\"${PT_container_command}\""
fi

if [ ! -z "${PT_clone_name+x}" ];
  then params="${params} clone_name=\"${PT_clone_name}\""
fi

if [ ! -z "${PT_lxc_path+x}" ];
  then params="${params} lxc_path=\"${PT_lxc_path}\""
fi

if [ ! -z "${PT_container_config+x}" ];
  then params="${params} container_config=\"${PT_container_config}\""
fi

if [ ! -z "${PT_fs_type+x}" ];
  then params="${params} fs_type=\"${PT_fs_type}\""
fi

if [ ! -z "${PT_archive+x}" ];
  then params="${params} archive=\"${PT_archive}\""
fi

if [ ! -z "${PT_vg_name+x}" ];
  then params="${params} vg_name=\"${PT_vg_name}\""
fi

if [ ! -z "${PT_clone_snapshot+x}" ];
  then params="${params} clone_snapshot=\"${PT_clone_snapshot}\""
fi

if [ ! -z "${PT_container_log+x}" ];
  then params="${params} container_log=\"${PT_container_log}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_lv_name+x}" ];
  then params="${params} lv_name=\"${PT_lv_name}\""
fi

if [ ! -z "${PT_fs_size+x}" ];
  then params="${params} fs_size=\"${PT_fs_size}\""
fi

if [ ! -z "${PT_archive_compression+x}" ];
  then params="${params} archive_compression=\"${PT_archive_compression}\""
fi

if [ ! -z "${PT_backing_store+x}" ];
  then params="${params} backing_store=\"${PT_backing_store}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_thinpool+x}" ];
  then params="${params} thinpool=\"${PT_thinpool}\""
fi

if [ ! -z "${PT_template+x}" ];
  then params="${params} template=\"${PT_template}\""
fi

if [ ! -z "${PT_directory+x}" ];
  then params="${params} directory=\"${PT_directory}\""
fi

if [ ! -z "${PT_config+x}" ];
  then params="${params} config=\"${PT_config}\""
fi

ansible localhost -m lxc_container --args "${params}" --one-line | cut -f2- -d">"