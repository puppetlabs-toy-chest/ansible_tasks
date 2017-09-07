#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_sort+x}" ];
  then params="${params} sort=\"${PT_sort}\""
fi

if [ ! -z "${PT_no_result_action+x}" ];
  then params="${params} no_result_action=\"${PT_no_result_action}\""
fi

if [ ! -z "${PT_sort_end+x}" ];
  then params="${params} sort_end=\"${PT_sort_end}\""
fi

if [ ! -z "${PT_sort_order+x}" ];
  then params="${params} sort_order=\"${PT_sort_order}\""
fi

if [ ! -z "${PT_owner+x}" ];
  then params="${params} owner=\"${PT_owner}\""
fi

if [ ! -z "${PT_is_public+x}" ];
  then params="${params} is_public=\"${PT_is_public}\""
fi

if [ ! -z "${PT_product_code+x}" ];
  then params="${params} product_code=\"${PT_product_code}\""
fi

if [ ! -z "${PT_ami_id+x}" ];
  then params="${params} ami_id=\"${PT_ami_id}\""
fi

if [ ! -z "${PT_name+x}" ];
  then params="${params} name=\"${PT_name}\""
fi

if [ ! -z "${PT_ami_tags+x}" ];
  then params="${params} ami_tags=\"${PT_ami_tags}\""
fi

if [ ! -z "${PT_hypervisor+x}" ];
  then params="${params} hypervisor=\"${PT_hypervisor}\""
fi

if [ ! -z "${PT_region+x}" ];
  then params="${params} region=\"${PT_region}\""
fi

if [ ! -z "${PT_sort_tag+x}" ];
  then params="${params} sort_tag=\"${PT_sort_tag}\""
fi

if [ ! -z "${PT_platform+x}" ];
  then params="${params} platform=\"${PT_platform}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_sort_start+x}" ];
  then params="${params} sort_start=\"${PT_sort_start}\""
fi

if [ ! -z "${PT_architecture+x}" ];
  then params="${params} architecture=\"${PT_architecture}\""
fi

if [ ! -z "${PT_virtualization_type+x}" ];
  then params="${params} virtualization_type=\"${PT_virtualization_type}\""
fi

ansible localhost -m ec2_ami_find --args "${params}" --one-line | cut -f2- -d">"