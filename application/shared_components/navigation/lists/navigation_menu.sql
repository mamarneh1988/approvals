prompt --application/shared_components/navigation/lists/navigation_menu
begin
--   Manifest
--     LIST: Navigation Menu
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>20
,p_default_application_id=>7870
,p_default_id_offset=>321337877993430365
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(294246755803215774)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1034617592460212)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(223171095075917800)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'More Information'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-info-square-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'14'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(294450250304216089)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Employees'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-users-alt'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(363893927036841058)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'My Approvals'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-tasks'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(363989550393942008)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'My Requests'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-server-new'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(363215950905936952)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Approvals Administration'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-tasks'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'6'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1226073126196936)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Pending Approvals'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-hourglass-2'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'12'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(362408671514012437)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Laptop Orders'
,p_list_item_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-laptop'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'19'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1007978133101517)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Setup'
,p_list_item_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gear'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'21'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(315337325227101943)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'test git'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-file-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'22'
);
wwv_flow_imp.component_end;
end;
/
