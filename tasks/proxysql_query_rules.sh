#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_flagOUT+x}" ];
  then params="${params} flagOUT=\"${PT_flagOUT}\""
fi

if [ ! -z "${PT_login_user+x}" ];
  then params="${params} login_user=\"${PT_login_user}\""
fi

if [ ! -z "${PT_save_to_disk+x}" ];
  then params="${params} save_to_disk=\"${PT_save_to_disk}\""
fi

if [ ! -z "${PT_match_pattern+x}" ];
  then params="${params} match_pattern=\"${PT_match_pattern}\""
fi

if [ ! -z "${PT_mirror_flagOUT+x}" ];
  then params="${params} mirror_flagOUT=\"${PT_mirror_flagOUT}\""
fi

if [ ! -z "${PT_apply+x}" ];
  then params="${params} apply=\"${PT_apply}\""
fi

if [ ! -z "${PT_schemaname+x}" ];
  then params="${params} schemaname=\"${PT_schemaname}\""
fi

if [ ! -z "${PT_replace_pattern+x}" ];
  then params="${params} replace_pattern=\"${PT_replace_pattern}\""
fi

if [ ! -z "${PT_digest+x}" ];
  then params="${params} digest=\"${PT_digest}\""
fi

if [ ! -z "${PT_match_digest+x}" ];
  then params="${params} match_digest=\"${PT_match_digest}\""
fi

if [ ! -z "${PT_mirror_hostgroup+x}" ];
  then params="${params} mirror_hostgroup=\"${PT_mirror_hostgroup}\""
fi

if [ ! -z "${PT_log+x}" ];
  then params="${params} log=\"${PT_log}\""
fi

if [ ! -z "${PT_delay+x}" ];
  then params="${params} delay=\"${PT_delay}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_proxy_addr+x}" ];
  then params="${params} proxy_addr=\"${PT_proxy_addr}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_config_file+x}" ];
  then params="${params} config_file=\"${PT_config_file}\""
fi

if [ ! -z "${PT_retries+x}" ];
  then params="${params} retries=\"${PT_retries}\""
fi

if [ ! -z "${PT_login_host+x}" ];
  then params="${params} login_host=\"${PT_login_host}\""
fi

if [ ! -z "${PT_destination_hostgroup+x}" ];
  then params="${params} destination_hostgroup=\"${PT_destination_hostgroup}\""
fi

if [ ! -z "${PT_proxy_port+x}" ];
  then params="${params} proxy_port=\"${PT_proxy_port}\""
fi

if [ ! -z "${PT_load_to_runtime+x}" ];
  then params="${params} load_to_runtime=\"${PT_load_to_runtime}\""
fi

if [ ! -z "${PT_login_password+x}" ];
  then params="${params} login_password=\"${PT_login_password}\""
fi

if [ ! -z "${PT_active+x}" ];
  then params="${params} active=\"${PT_active}\""
fi

if [ ! -z "${PT_cache_ttl+x}" ];
  then params="${params} cache_ttl=\"${PT_cache_ttl}\""
fi

if [ ! -z "${PT_error_msg+x}" ];
  then params="${params} error_msg=\"${PT_error_msg}\""
fi

if [ ! -z "${PT_login_port+x}" ];
  then params="${params} login_port=\"${PT_login_port}\""
fi

if [ ! -z "${PT_negate_match_pattern+x}" ];
  then params="${params} negate_match_pattern=\"${PT_negate_match_pattern}\""
fi

if [ ! -z "${PT_flagIN+x}" ];
  then params="${params} flagIN=\"${PT_flagIN}\""
fi

if [ ! -z "${PT_client_addr+x}" ];
  then params="${params} client_addr=\"${PT_client_addr}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_force_delete+x}" ];
  then params="${params} force_delete=\"${PT_force_delete}\""
fi

if [ ! -z "${PT_rule_id+x}" ];
  then params="${params} rule_id=\"${PT_rule_id}\""
fi

ansible localhost -m proxysql_query_rules --args "${params}" --one-line | cut -f2- -d">"