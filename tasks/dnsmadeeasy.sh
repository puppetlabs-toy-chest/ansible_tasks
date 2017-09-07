#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_httpFqdn+x}" ];
  then params="${params} httpFqdn=\"${PT_httpFqdn}\""
fi

if [ ! -z "${PT_domain+x}" ];
  then params="${params} domain=\"${PT_domain}\""
fi

if [ ! -z "${PT_protocol+x}" ];
  then params="${params} protocol=\"${PT_protocol}\""
fi

if [ ! -z "${PT_autoFailover+x}" ];
  then params="${params} autoFailover=\"${PT_autoFailover}\""
fi

if [ ! -z "${PT_record_ttl+x}" ];
  then params="${params} record_ttl=\"${PT_record_ttl}\""
fi

if [ ! -z "${PT_sensitivity+x}" ];
  then params="${params} sensitivity=\"${PT_sensitivity}\""
fi

if [ ! -z "${PT_contactList+x}" ];
  then params="${params} contactList=\"${PT_contactList}\""
fi

if [ ! -z "${PT_account_key+x}" ];
  then params="${params} account_key=\"${PT_account_key}\""
fi

if [ ! -z "${PT_ip2+x}" ];
  then params="${params} ip2=\"${PT_ip2}\""
fi

if [ ! -z "${PT_record_type+x}" ];
  then params="${params} record_type=\"${PT_record_type}\""
fi

if [ ! -z "${PT_ip1+x}" ];
  then params="${params} ip1=\"${PT_ip1}\""
fi

if [ ! -z "${PT_ip4+x}" ];
  then params="${params} ip4=\"${PT_ip4}\""
fi

if [ ! -z "${PT_ip5+x}" ];
  then params="${params} ip5=\"${PT_ip5}\""
fi

if [ ! -z "${PT_record_name+x}" ];
  then params="${params} record_name=\"${PT_record_name}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_monitor+x}" ];
  then params="${params} monitor=\"${PT_monitor}\""
fi

if [ ! -z "${PT_ip3+x}" ];
  then params="${params} ip3=\"${PT_ip3}\""
fi

if [ ! -z "${PT_httpQueryString+x}" ];
  then params="${params} httpQueryString=\"${PT_httpQueryString}\""
fi

if [ ! -z "${PT_failover+x}" ];
  then params="${params} failover=\"${PT_failover}\""
fi

if [ ! -z "${PT_maxEmails+x}" ];
  then params="${params} maxEmails=\"${PT_maxEmails}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_systemDescription+x}" ];
  then params="${params} systemDescription=\"${PT_systemDescription}\""
fi

if [ ! -z "${PT_record_value+x}" ];
  then params="${params} record_value=\"${PT_record_value}\""
fi

if [ ! -z "${PT_httpFile+x}" ];
  then params="${params} httpFile=\"${PT_httpFile}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_account_secret+x}" ];
  then params="${params} account_secret=\"${PT_account_secret}\""
fi

ansible localhost -m dnsmadeeasy --args "${params}" --one-line | cut -f2- -d">"