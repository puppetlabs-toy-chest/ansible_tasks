#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_samba_name+x}" ];
  then params="${params} samba_name=\"${PT_samba_name}\""
fi

if [ ! -z "${PT_samba_hide_files+x}" ];
  then params="${params} samba_hide_files=\"${PT_samba_hide_files}\""
fi

if [ ! -z "${PT_samba_blocking_locks+x}" ];
  then params="${params} samba_blocking_locks=\"${PT_samba_blocking_locks}\""
fi

if [ ! -z "${PT_samba_directory_mode+x}" ];
  then params="${params} samba_directory_mode=\"${PT_samba_directory_mode}\""
fi

if [ ! -z "${PT_samba_dos_filemode+x}" ];
  then params="${params} samba_dos_filemode=\"${PT_samba_dos_filemode}\""
fi

if [ ! -z "${PT_samba_postexec+x}" ];
  then params="${params} samba_postexec=\"${PT_samba_postexec}\""
fi

if [ ! -z "${PT_owner+x}" ];
  then params="${params} owner=\"${PT_owner}\""
fi

if [ ! -z "${PT_samba_fake_oplocks+x}" ];
  then params="${params} samba_fake_oplocks=\"${PT_samba_fake_oplocks}\""
fi

if [ ! -z "${PT_samba_strict_locking+x}" ];
  then params="${params} samba_strict_locking=\"${PT_samba_strict_locking}\""
fi

if [ ! -z "${PT_samba_public+x}" ];
  then params="${params} samba_public=\"${PT_samba_public}\""
fi

if [ ! -z "${PT_samba_force_directory_security_mode+x}" ];
  then params="${params} samba_force_directory_security_mode=\"${PT_samba_force_directory_security_mode}\""
fi

if [ ! -z "${PT_group+x}" ];
  then params="${params} group=\"${PT_group}\""
fi

if [ ! -z "${PT_samba_writeable+x}" ];
  then params="${params} samba_writeable=\"${PT_samba_writeable}\""
fi

if [ ! -z "${PT_samba_nt_acl_support+x}" ];
  then params="${params} samba_nt_acl_support=\"${PT_samba_nt_acl_support}\""
fi

if [ ! -z "${PT_samba_write_list+x}" ];
  then params="${params} samba_write_list=\"${PT_samba_write_list}\""
fi

if [ ! -z "${PT_samba_preexec+x}" ];
  then params="${params} samba_preexec=\"${PT_samba_preexec}\""
fi

if [ ! -z "${PT_samba_browseable+x}" ];
  then params="${params} samba_browseable=\"${PT_samba_browseable}\""
fi

if [ ! -z "${PT_samba_inherit_acls+x}" ];
  then params="${params} samba_inherit_acls=\"${PT_samba_inherit_acls}\""
fi

if [ ! -z "${PT_samba_msdfs_root+x}" ];
  then params="${params} samba_msdfs_root=\"${PT_samba_msdfs_root}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_samba_valid_users+x}" ];
  then params="${params} samba_valid_users=\"${PT_samba_valid_users}\""
fi

if [ ! -z "${PT_samba_force_create_mode+x}" ];
  then params="${params} samba_force_create_mode=\"${PT_samba_force_create_mode}\""
fi

if [ ! -z "${PT_root_squash+x}" ];
  then params="${params} root_squash=\"${PT_root_squash}\""
fi

if [ ! -z "${PT_samba_directory_security_mode+x}" ];
  then params="${params} samba_directory_security_mode=\"${PT_samba_directory_security_mode}\""
fi

if [ ! -z "${PT_samba_force_group+x}" ];
  then params="${params} samba_force_group=\"${PT_samba_force_group}\""
fi

if [ ! -z "${PT_samba_vfs_objects+x}" ];
  then params="${params} samba_vfs_objects=\"${PT_samba_vfs_objects}\""
fi

if [ ! -z "${PT_samba_force_directory_mode+x}" ];
  then params="${params} samba_force_directory_mode=\"${PT_samba_force_directory_mode}\""
fi

if [ ! -z "${PT_writeable+x}" ];
  then params="${params} writeable=\"${PT_writeable}\""
fi

if [ ! -z "${PT_samba_locking+x}" ];
  then params="${params} samba_locking=\"${PT_samba_locking}\""
fi

if [ ! -z "${PT_samba_security_mode+x}" ];
  then params="${params} samba_security_mode=\"${PT_samba_security_mode}\""
fi

if [ ! -z "${PT_samba_inherit_owner+x}" ];
  then params="${params} samba_inherit_owner=\"${PT_samba_inherit_owner}\""
fi

if [ ! -z "${PT_samba_csc_policy+x}" ];
  then params="${params} samba_csc_policy=\"${PT_samba_csc_policy}\""
fi

if [ ! -z "${PT_sync+x}" ];
  then params="${params} sync=\"${PT_sync}\""
fi

if [ ! -z "${PT_nfs_hosts+x}" ];
  then params="${params} nfs_hosts=\"${PT_nfs_hosts}\""
fi

if [ ! -z "${PT_path+x}" ];
  then params="${params} path=\"${PT_path}\""
fi

if [ ! -z "${PT_nfs_custom_settings+x}" ];
  then params="${params} nfs_custom_settings=\"${PT_nfs_custom_settings}\""
fi

if [ ! -z "${PT_samba_force_user+x}" ];
  then params="${params} samba_force_user=\"${PT_samba_force_user}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_samba_invalid_users+x}" ];
  then params="${params} samba_invalid_users=\"${PT_samba_invalid_users}\""
fi

if [ ! -z "${PT_samba_create_mode+x}" ];
  then params="${params} samba_create_mode=\"${PT_samba_create_mode}\""
fi

if [ ! -z "${PT_samba_force_security_mode+x}" ];
  then params="${params} samba_force_security_mode=\"${PT_samba_force_security_mode}\""
fi

if [ ! -z "${PT_samba_level_2_oplocks+x}" ];
  then params="${params} samba_level_2_oplocks=\"${PT_samba_level_2_oplocks}\""
fi

if [ ! -z "${PT_samba_custom_settings+x}" ];
  then params="${params} samba_custom_settings=\"${PT_samba_custom_settings}\""
fi

if [ ! -z "${PT_samba_hide_unreadable+x}" ];
  then params="${params} samba_hide_unreadable=\"${PT_samba_hide_unreadable}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_samba_block_size+x}" ];
  then params="${params} samba_block_size=\"${PT_samba_block_size}\""
fi

if [ ! -z "${PT_samba_oplocks+x}" ];
  then params="${params} samba_oplocks=\"${PT_samba_oplocks}\""
fi

if [ ! -z "${PT_samba_hosts_allow+x}" ];
  then params="${params} samba_hosts_allow=\"${PT_samba_hosts_allow}\""
fi

if [ ! -z "${PT_samba_inherit_permissions+x}" ];
  then params="${params} samba_inherit_permissions=\"${PT_samba_inherit_permissions}\""
fi

if [ ! -z "${PT_subtree_checking+x}" ];
  then params="${params} subtree_checking=\"${PT_subtree_checking}\""
fi

if [ ! -z "${PT_directorymode+x}" ];
  then params="${params} directorymode=\"${PT_directorymode}\""
fi

if [ ! -z "${PT_ou+x}" ];
  then params="${params} ou=\"${PT_ou}\""
fi

if [ ! -z "${PT_samba_hosts_deny+x}" ];
  then params="${params} samba_hosts_deny=\"${PT_samba_hosts_deny}\""
fi

ansible localhost -m udm_share --args "${params}" --one-line | cut -f2- -d">"