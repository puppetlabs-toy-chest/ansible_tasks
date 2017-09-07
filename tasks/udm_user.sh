#!/usr/bin/env bash

if ! which ansible &> /dev/null; then
  echo '{"_error": {"msg": "Ansible must be installed and on PATH to run ansible modules", "kind": "ansible/not-installed", "details": {}}}'
  exit 1
fi

params=''
if [ ! -z "${PT_update_password+x}" ];
  then params="${params} update_password=\"${PT_update_password}\""
fi

if [ ! -z "${PT_samba_user_workstations+x}" ];
  then params="${params} samba_user_workstations=\"${PT_samba_user_workstations}\""
fi

if [ ! -z "${PT_homedrive+x}" ];
  then params="${params} homedrive=\"${PT_homedrive}\""
fi

if [ ! -z "${PT_room_number+x}" ];
  then params="${params} room_number=\"${PT_room_number}\""
fi

if [ ! -z "${PT_primary_group+x}" ];
  then params="${params} primary_group=\"${PT_primary_group}\""
fi

if [ ! -z "${PT_postcode+x}" ];
  then params="${params} postcode=\"${PT_postcode}\""
fi

if [ ! -z "${PT_scriptpath+x}" ];
  then params="${params} scriptpath=\"${PT_scriptpath}\""
fi

if [ ! -z "${PT_home_share+x}" ];
  then params="${params} home_share=\"${PT_home_share}\""
fi

if [ ! -z "${PT_override_pw_history+x}" ];
  then params="${params} override_pw_history=\"${PT_override_pw_history}\""
fi

if [ ! -z "${PT_city+x}" ];
  then params="${params} city=\"${PT_city}\""
fi

if [ ! -z "${PT_display_name+x}" ];
  then params="${params} display_name=\"${PT_display_name}\""
fi

if [ ! -z "${PT_pager_telephonenumber+x}" ];
  then params="${params} pager_telephonenumber=\"${PT_pager_telephonenumber}\""
fi

if [ ! -z "${PT_employee_number+x}" ];
  then params="${params} employee_number=\"${PT_employee_number}\""
fi

if [ ! -z "${PT_serviceprovider+x}" ];
  then params="${params} serviceprovider=\"${PT_serviceprovider}\""
fi

if [ ! -z "${PT_organisation+x}" ];
  then params="${params} organisation=\"${PT_organisation}\""
fi

if [ ! -z "${PT_subpath+x}" ];
  then params="${params} subpath=\"${PT_subpath}\""
fi

if [ ! -z "${PT_state+x}" ];
  then params="${params} state=\"${PT_state}\""
fi

if [ ! -z "${PT_home_share_path+x}" ];
  then params="${params} home_share_path=\"${PT_home_share_path}\""
fi

if [ ! -z "${PT_userexpiry+x}" ];
  then params="${params} userexpiry=\"${PT_userexpiry}\""
fi

if [ ! -z "${PT_unixhome+x}" ];
  then params="${params} unixhome=\"${PT_unixhome}\""
fi

if [ ! -z "${PT_mail_home_server+x}" ];
  then params="${params} mail_home_server=\"${PT_mail_home_server}\""
fi

if [ ! -z "${PT_email+x}" ];
  then params="${params} email=\"${PT_email}\""
fi

if [ ! -z "${PT_sambahome+x}" ];
  then params="${params} sambahome=\"${PT_sambahome}\""
fi

if [ ! -z "${PT_username+x}" ];
  then params="${params} username=\"${PT_username}\""
fi

if [ ! -z "${PT_home_telephone_number+x}" ];
  then params="${params} home_telephone_number=\"${PT_home_telephone_number}\""
fi

if [ ! -z "${PT_shell+x}" ];
  then params="${params} shell=\"${PT_shell}\""
fi

if [ ! -z "${PT_description+x}" ];
  then params="${params} description=\"${PT_description}\""
fi

if [ ! -z "${PT_firstname+x}" ];
  then params="${params} firstname=\"${PT_firstname}\""
fi

if [ ! -z "${PT_lastname+x}" ];
  then params="${params} lastname=\"${PT_lastname}\""
fi

if [ ! -z "${PT_mail_alternative_address+x}" ];
  then params="${params} mail_alternative_address=\"${PT_mail_alternative_address}\""
fi

if [ ! -z "${PT_phone+x}" ];
  then params="${params} phone=\"${PT_phone}\""
fi

if [ ! -z "${PT_birthday+x}" ];
  then params="${params} birthday=\"${PT_birthday}\""
fi

if [ ! -z "${PT_groups+x}" ];
  then params="${params} groups=\"${PT_groups}\""
fi

if [ ! -z "${PT_profilepath+x}" ];
  then params="${params} profilepath=\"${PT_profilepath}\""
fi

if [ ! -z "${PT_employee_type+x}" ];
  then params="${params} employee_type=\"${PT_employee_type}\""
fi

if [ ! -z "${PT_password+x}" ];
  then params="${params} password=\"${PT_password}\""
fi

if [ ! -z "${PT_pwd_change_next_login+x}" ];
  then params="${params} pwd_change_next_login=\"${PT_pwd_change_next_login}\""
fi

if [ ! -z "${PT_mail_primary_address+x}" ];
  then params="${params} mail_primary_address=\"${PT_mail_primary_address}\""
fi

if [ ! -z "${PT_country+x}" ];
  then params="${params} country=\"${PT_country}\""
fi

if [ ! -z "${PT_title+x}" ];
  then params="${params} title=\"${PT_title}\""
fi

if [ ! -z "${PT_override_pw_length+x}" ];
  then params="${params} override_pw_length=\"${PT_override_pw_length}\""
fi

if [ ! -z "${PT_street+x}" ];
  then params="${params} street=\"${PT_street}\""
fi

if [ ! -z "${PT_gecos+x}" ];
  then params="${params} gecos=\"${PT_gecos}\""
fi

if [ ! -z "${PT_mobile_telephone_number+x}" ];
  then params="${params} mobile_telephone_number=\"${PT_mobile_telephone_number}\""
fi

if [ ! -z "${PT_position+x}" ];
  then params="${params} position=\"${PT_position}\""
fi

if [ ! -z "${PT_ou+x}" ];
  then params="${params} ou=\"${PT_ou}\""
fi

if [ ! -z "${PT_department_number+x}" ];
  then params="${params} department_number=\"${PT_department_number}\""
fi

if [ ! -z "${PT_samba_privileges+x}" ];
  then params="${params} samba_privileges=\"${PT_samba_privileges}\""
fi

if [ ! -z "${PT_secretary+x}" ];
  then params="${params} secretary=\"${PT_secretary}\""
fi

ansible localhost -m udm_user --args "${params}" --one-line | cut -f2- -d">"