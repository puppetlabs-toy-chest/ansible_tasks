#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_seq+x}" ];
  then params="${params} seq=\"${PT_seq}\""
fi

if [ ! -z "${PT_time-range+x}" ];
  then params="${params} time-range=\"${PT_time-range}\""
fi

if [ ! -z "${PT_dest_port_op+x}" ];
  then params="${params} dest_port_op=\"${PT_dest_port_op}\""
fi

if [ ! -z "${PT_use_ssl+x}" ];
  then params="${params} use_ssl=\"${PT_use_ssl}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_transport+x}" ];
  then params="${params} transport=\"${PT_transport}\""
fi

if [ ! -z "${PT_established+x}" ];
  then params="${params} established=\"${PT_established}\""
fi

if [ ! -z "${PT_log+x}" ];
  then params="${params} log=\"${PT_log}\""
fi

if [ ! -z "${PT_proto+x}" ];
  then params="${params} proto=\"${PT_proto}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_provider+x}" ];
  then params="${params} provider=\"${PT_provider}\""
fi

if [ ! -z "${PT_fragments+x}" ];
  then params="${params} fragments=\"${PT_fragments}\""
fi

if [ ! -z "${PT_src_port1+x}" ];
  then params="${params} src_port1=\"${PT_src_port1}\""
fi

if [ ! -z "${PT_src_port2+x}" ];
  then params="${params} src_port2=\"${PT_src_port2}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_src_port_op+x}" ];
  then params="${params} src_port_op=\"${PT_src_port_op}\""
fi

if [ ! -z "${PT_psh+x}" ];
  then params="${params} psh=\"${PT_psh}\""
fi

if [ ! -z "${PT_dest+x}" ];
  then params="${params} dest=\"${PT_dest}\""
fi

if [ ! -z "${PT_syn+x}" ];
  then params="${params} syn=\"${PT_syn}\""
fi

if [ ! -z "${PT_dscp+x}" ];
  then params="${params} dscp=\"${PT_dscp}\""
fi

if [ ! -z "${PT_host+x}" ];
  then params="${params} host=\"${PT_host}\""
fi

if [ ! -z "${PT_urg+x}" ];
  then params="${params} urg=\"${PT_urg}\""
fi

if [ ! -z "${PT_rst+x}" ];
  then params="${params} rst=\"${PT_rst}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_src+x}" ];
  then params="${params} src=\"${PT_src}\""
fi

if [ ! -z "${PT_remark+x}" ];
  then params="${params} remark=\"${PT_remark}\""
fi

if [ ! -z "${PT_ssh_keyfile+x}" ];
  then params="${params} ssh_keyfile=\"${PT_ssh_keyfile}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_ack+x}" ];
  then params="${params} ack=\"${PT_ack}\""
fi

if [ ! -z "${PT_fin+x}" ];
  then params="${params} fin=\"${PT_fin}\""
fi

if [ ! -z "${PT_precedence+x}" ];
  then params="${params} precedence=\"${PT_precedence}\""
fi

if [ ! -z "${PT_timeout+x}" ];
  then params="${params} timeout=\"${PT_timeout}\""
fi

if [ ! -z "${PT_action+x}" ];
  then params="${params} action=\"${PT_action}\""
fi

if [ ! -z "${PT_dest_port1+x}" ];
  then params="${params} dest_port1=\"${PT_dest_port1}\""
fi

if [ ! -z "${PT_dest_port2+x}" ];
  then params="${params} dest_port2=\"${PT_dest_port2}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

ansible localhost -m nxos_acl --args "${params}" --one-line | cut -f2- -d">"