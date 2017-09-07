#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_profile+x}" ];
  then params="${params} profile=\"${PT_profile}\""
fi

if [ ! -z "${PT_force+x}" ];
  then params="${params} force=\"${PT_force}\""
fi

if [ ! -z "${PT_client_id+x}" ];
  then params="${params} client_id=\"${PT_client_id}\""
fi

if [ ! -z "${PT_resource_group+x}" ];
  then params="${params} resource_group=\"${PT_resource_group}\""
fi

if [ ! -z "${PT_tags+x}" ];
  then params="${params} tags=\"${PT_tags}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_content_language+x}" ];
  then params="${params} content_language=\"${PT_content_language}\""
fi

if [ ! -z "${PT_content_type+x}" ];
  then params="${params} content_type=\"${PT_content_type}\""
fi

if [ ! -z "${PT_public_access+x}" ];
  then params="${params} public_access=\"${PT_public_access}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_container+x}" ];
  then params="${params} container=\"${PT_container}\""
fi

if [ ! -z "${PT_append_tags+x}" ];
  then params="${params} append_tags=\"${PT_append_tags}\""
fi

if [ ! -z "${PT_ad_user+x}" ];
  then params="${params} ad_user=\"${PT_ad_user}\""
fi

if [ ! -z "${PT_secret+x}" ];
  then params="${params} secret=\"${PT_secret}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_blob+x}" ];
  then params="${params} blob=\"${PT_blob}\""
fi

if [ ! -z "${PT_content_md5+x}" ];
  then params="${params} content_md5=\"${PT_content_md5}\""
fi

if [ ! -z "${PT_subscription_id+x}" ];
  then params="${params} subscription_id=\"${PT_subscription_id}\""
fi

if [ ! -z "${PT_storage_account_name+x}" ];
  then params="${params} storage_account_name=\"${PT_storage_account_name}\""
fi

if [ ! -z "${PT_content_disposition+x}" ];
  then params="${params} content_disposition=\"${PT_content_disposition}\""
fi

if [ ! -z "${PT_cache_control+x}" ];
  then params="${params} cache_control=\"${PT_cache_control}\""
fi

if [ ! -z "${PT_content_encoding+x}" ];
  then params="${params} content_encoding=\"${PT_content_encoding}\""
fi

ansible localhost -m azure_rm_storageblob --args "${params}" --one-line | cut -f2- -d">"