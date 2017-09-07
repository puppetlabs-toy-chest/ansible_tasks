#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_vca_configuration+x}" ];
  then params="${params} vca_configuration=\"${PT_vca_configuration}\""
fi

if [ ! -z "${PT_proxy_configuration+x}" ];
  then params="${params} proxy_configuration=\"${PT_proxy_configuration}\""
fi

if [ ! -z "${PT_docker_configuration+x}" ];
  then params="${params} docker_configuration=\"${PT_docker_configuration}\""
fi

if [ ! -z "${PT_oshiftk8s_configuration+x}" ];
  then params="${params} oshiftk8s_configuration=\"${PT_oshiftk8s_configuration}\""
fi

if [ ! -z "${PT_mtu+x}" ];
  then params="${params} mtu=\"${PT_mtu}\""
fi

if [ ! -z "${PT_rancher_configuration+x}" ];
  then params="${params} rancher_configuration=\"${PT_rancher_configuration}\""
fi

if [ ! -z "${PT_vtype+x}" ];
  then params="${params} vtype=\"${PT_vtype}\""
fi

if [ ! -z "${PT_uuid+x}" ];
  then params="${params} uuid=\"${PT_uuid}\""
fi

if [ ! -z "${PT_linuxserver_configuration+x}" ];
  then params="${params} linuxserver_configuration=\"${PT_linuxserver_configuration}\""
fi

if [ ! -z "${PT_nsx_configuration+x}" ];
  then params="${params} nsx_configuration=\"${PT_nsx_configuration}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_apic_mode+x}" ];
  then params="${params} apic_mode=\"${PT_apic_mode}\""
fi

if [ ! -z "${PT_dns_provider_ref+x}" ];
  then params="${params} dns_provider_ref=\"${PT_dns_provider_ref}\""
fi

if [ ! -z "${PT_api_version+x}" ];
  then params="${params} api_version=\"${PT_api_version}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_mesos_configuration+x}" ];
  then params="${params} mesos_configuration=\"${PT_mesos_configuration}\""
fi

if [ ! -z "${PT_openstack_configuration+x}" ];
  then params="${params} openstack_configuration=\"${PT_openstack_configuration}\""
fi

if [ ! -z "${PT_enable_vip_static_routes+x}" ];
  then params="${params} enable_vip_static_routes=\"${PT_enable_vip_static_routes}\""
fi

if [ ! -z "${PT_controller+x}" ];
  then params="${params} controller=\"${PT_controller}\""
fi

if [ ! -z "${PT_aws_configuration+x}" ];
  then params="${params} aws_configuration=\"${PT_aws_configuration}\""
fi

if [ ! -z "${PT_cloudstack_configuration+x}" ];
  then params="${params} cloudstack_configuration=\"${PT_cloudstack_configuration}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_tenant+x}" ];
  then params="${params} tenant=\"${PT_tenant}\""
fi

if [ ! -z "${PT_ipam_provider_ref+x}" ];
  then params="${params} ipam_provider_ref=\"${PT_ipam_provider_ref}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_url+x}" ];
  then params="${params} url=\"${PT_url}\""
fi

if [ ! -z "${PT_tenant_ref+x}" ];
  then params="${params} tenant_ref=\"${PT_tenant_ref}\""
fi

if [ ! -z "${PT_dhcp_enabled+x}" ];
  then params="${params} dhcp_enabled=\"${PT_dhcp_enabled}\""
fi

if [ ! -z "${PT_east_west_ipam_provider_ref+x}" ];
  then params="${params} east_west_ipam_provider_ref=\"${PT_east_west_ipam_provider_ref}\""
fi

if [ ! -z "${PT_obj_name_prefix+x}" ];
  then params="${params} obj_name_prefix=\"${PT_obj_name_prefix}\""
fi

if [ ! -z "${PT_apic_configuration+x}" ];
  then params="${params} apic_configuration=\"${PT_apic_configuration}\""
fi

if [ ! -z "${PT_prefer_static_routes+x}" ];
  then params="${params} prefer_static_routes=\"${PT_prefer_static_routes}\""
fi

if [ ! -z "${PT_license_type+x}" ];
  then params="${params} license_type=\"${PT_license_type}\""
fi

if [ ! -z "${PT_vcenter_configuration+x}" ];
  then params="${params} vcenter_configuration=\"${PT_vcenter_configuration}\""
fi

if [ ! -z "${PT_tenant_uuid+x}" ];
  then params="${params} tenant_uuid=\"${PT_tenant_uuid}\""
fi

if [ ! -z "${PT_east_west_dns_provider_ref+x}" ];
  then params="${params} east_west_dns_provider_ref=\"${PT_east_west_dns_provider_ref}\""
fi

ansible localhost -m avi_cloud --args "${params}" --one-line | cut -f2- -d">"