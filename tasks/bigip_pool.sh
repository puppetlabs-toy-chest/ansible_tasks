#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_lb_method+x}" ];
  then params="${params} lb_method=\"${PT_lb_method}\""
fi

if [ ! -z "${PT_reselect_tries+x}" ];
  then params="${params} reselect_tries=\"${PT_reselect_tries}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_service_down_action+x}" ];
  then params="${params} service_down_action=\"${PT_service_down_action}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_user+x}" ];
  then params="${params} user=\"${PT_user}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_monitors+x}" ];
  then params="${params} monitors=\"${PT_monitors}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_quorum+x}" ];
  then params="${params} quorum=\"${PT_quorum}\""
fi

if [ ! -z "${PT_slow_ramp_time+x}" ];
  then params="${params} slow_ramp_time=\"${PT_slow_ramp_time}\""
fi

if [ ! -z "${PT_server+x}" ];
  then params="${params} server=\"${PT_server}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_server_port+x}" ];
  then params="${params} server_port=\"${PT_server_port}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_monitor_type+x}" ];
  then params="${params} monitor_type=\"${PT_monitor_type}\""
fi

ansible localhost -m bigip_pool --args "${params}" --one-line | cut -f2- -d">"