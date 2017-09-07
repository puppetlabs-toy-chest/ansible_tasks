#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_rx_rate+x}" ];
  then params="${params} rx_rate=\"${PT_rx_rate}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_duplex+x}" ];
  then params="${params} duplex=\"${PT_duplex}\""
fi

if [ ! -z "${PT_enabled+x}" ];
  then params="${params} enabled=\"${PT_enabled}\""
fi

if [ ! -z "${PT_collection+x}" ];
  then params="${params} collection=\"${PT_collection}\""
fi

if [ ! -z "${PT_mtu+x}" ];
  then params="${params} mtu=\"${PT_mtu}\""
fi

if [ ! -z "${PT_purge+x}" ];
  then params="${params} purge=\"${PT_purge}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_speed+x}" ];
  then params="${params} speed=\"${PT_speed}\""
fi

if [ ! -z "${PT_tx_rate+x}" ];
  then params="${params} tx_rate=\"${PT_tx_rate}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

ansible localhost -m net_interface --args "${params}" --one-line | cut -f2- -d">"