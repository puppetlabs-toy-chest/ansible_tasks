#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_comment+x}" ];
  then params="${params} comment=\"${PT_comment}\""
fi

if [ ! -z "${PT_tcpb+x}" ];
  then params="${params} tcpb=\"${PT_tcpb}\""
fi

if [ ! -z "${PT_cka+x}" ];
  then params="${params} cka=\"${PT_cka}\""
fi

if [ ! -z "${PT_cachetype+x}" ];
  then params="${params} cachetype=\"${PT_cachetype}\""
fi

if [ ! -z "${PT_ip+x}" ];
  then params="${params} ip=\"${PT_ip}\""
fi

if [ ! -z "${PT_servername+x}" ];
  then params="${params} servername=\"${PT_servername}\""
fi

if [ ! -z "${PT_save_config+x}" ];
  then params="${params} save_config=\"${PT_save_config}\""
fi

if [ ! -z "${PT_nitro_protocol+x}" ];
  then params="${params} nitro_protocol=\"${PT_nitro_protocol}\""
fi

if [ ! -z "${PT_maxreq+x}" ];
  then params="${params} maxreq=\"${PT_maxreq}\""
fi

if [ ! -z "${PT_monitor_bindings+x}" ];
  then params="${params} monitor_bindings=\"${PT_monitor_bindings}\""
fi

if [ ! -z "${PT_maxbandwidth+x}" ];
  then params="${params} maxbandwidth=\"${PT_maxbandwidth}\""
fi

if [ ! -z "${PT_svrtimeout+x}" ];
  then params="${params} svrtimeout=\"${PT_svrtimeout}\""
fi

if [ ! -z "${PT_port+x}" ];
  then params="${params} port=\"${PT_port}\""
fi

if [ ! -z "${PT_clttimeout+x}" ];
  then params="${params} clttimeout=\"${PT_clttimeout}\""
fi

if [ ! -z "${PT_servicetype+x}" ];
  then params="${params} servicetype=\"${PT_servicetype}\""
fi

if [ ! -z "${PT_cacheable+x}" ];
  then params="${params} cacheable=\"${PT_cacheable}\""
fi

if [ ! -z "${PT_pathmonitor+x}" ];
  then params="${params} pathmonitor=\"${PT_pathmonitor}\""
fi

if [ ! -z "${PT_maxclient+x}" ];
  then params="${params} maxclient=\"${PT_maxclient}\""
fi

if [ ! -z "${PT_ipaddress+x}" ];
  then params="${params} ipaddress=\"${PT_ipaddress}\""
fi

if [ ! -z "${PT_graceful+x}" ];
  then params="${params} graceful=\"${PT_graceful}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_usip+x}" ];
  then params="${params} usip=\"${PT_usip}\""
fi

if [ ! -z "${PT_nitro_user+x}" ];
  then params="${params} nitro_user=\"${PT_nitro_user}\""
fi

if [ ! -z "${PT_netprofile+x}" ];
  then params="${params} netprofile=\"${PT_netprofile}\""
fi

if [ ! -z "${PT_rtspsessionidremap+x}" ];
  then params="${params} rtspsessionidremap=\"${PT_rtspsessionidremap}\""
fi

if [ ! -z "${PT_td+x}" ];
  then params="${params} td=\"${PT_td}\""
fi

if [ ! -z "${PT_nitro_timeout+x}" ];
  then params="${params} nitro_timeout=\"${PT_nitro_timeout}\""
fi

if [ ! -z "${PT_pathmonitorindv+x}" ];
  then params="${params} pathmonitorindv=\"${PT_pathmonitorindv}\""
fi

if [ ! -z "${PT_cleartextport+x}" ];
  then params="${params} cleartextport=\"${PT_cleartextport}\""
fi

if [ ! -z "${PT_appflowlog+x}" ];
  then params="${params} appflowlog=\"${PT_appflowlog}\""
fi

if [ ! -z "${PT_customserverid+x}" ];
  then params="${params} customserverid=\"${PT_customserverid}\""
fi

if [ ! -z "${PT_monthreshold+x}" ];
  then params="${params} monthreshold=\"${PT_monthreshold}\""
fi

if [ ! -z "${PT_hashid+x}" ];
  then params="${params} hashid=\"${PT_hashid}\""
fi

if [ ! -z "${PT_serverid+x}" ];
  then params="${params} serverid=\"${PT_serverid}\""
fi

if [ ! -z "${PT_processlocal+x}" ];
  then params="${params} processlocal=\"${PT_processlocal}\""
fi

if [ ! -z "${PT_accessdown+x}" ];
  then params="${params} accessdown=\"${PT_accessdown}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_tcpprofilename+x}" ];
  then params="${params} tcpprofilename=\"${PT_tcpprofilename}\""
fi

if [ ! -z "${PT_sp+x}" ];
  then params="${params} sp=\"${PT_sp}\""
fi

if [ ! -z "${PT_downstateflush+x}" ];
  then params="${params} downstateflush=\"${PT_downstateflush}\""
fi

if [ ! -z "${PT_cipheader+x}" ];
  then params="${params} cipheader=\"${PT_cipheader}\""
fi

if [ ! -z "${PT_httpprofilename+x}" ];
  then params="${params} httpprofilename=\"${PT_httpprofilename}\""
fi

if [ ! -z "${PT_nsip+x}" ];
  then params="${params} nsip=\"${PT_nsip}\""
fi

if [ ! -z "${PT_cip+x}" ];
  then params="${params} cip=\"${PT_cip}\""
fi

if [ ! -z "${PT_healthmonitor+x}" ];
  then params="${params} healthmonitor=\"${PT_healthmonitor}\""
fi

if [ ! -z "${PT_useproxyport+x}" ];
  then params="${params} useproxyport=\"${PT_useproxyport}\""
fi

if [ ! -z "${PT_sc+x}" ];
  then params="${params} sc=\"${PT_sc}\""
fi

if [ ! -z "${PT_nitro_pass+x}" ];
  then params="${params} nitro_pass=\"${PT_nitro_pass}\""
fi

if [ ! -z "${PT_dnsprofilename+x}" ];
  then params="${params} dnsprofilename=\"${PT_dnsprofilename}\""
fi

if [ ! -z "${PT_validate_certs+x}" ];
  then params="${params} validate_certs=\"${PT_validate_certs}\""
fi

if [ ! -z "${PT_cmp+x}" ];
  then params="${params} cmp=\"${PT_cmp}\""
fi

ansible localhost -m netscaler_service --args "${params}" --one-line | cut -f2- -d">"