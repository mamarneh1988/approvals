prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
--   Manifest
--     MENU: Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>20
,p_default_application_id=>7870
,p_default_id_offset=>321337877993430365
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(294246200659215771)
,p_name=>'Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(315336466506101935)
,p_short_name=>'test git'
,p_link=>'f?p=&APP_ID.:22:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>22
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1008936011101525)
,p_short_name=>'Setup'
,p_link=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:::'
,p_page_id=>21
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(1226872697196948)
,p_short_name=>'Pending Approvals'
,p_link=>'f?p=&APP_ID.:12:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>12
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(215724114974522539)
,p_parent_id=>wwv_flow_imp.id(1008936011101525)
,p_short_name=>'Email Settings'
,p_link=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:::'
,p_page_id=>11
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(215724289553526002)
,p_parent_id=>wwv_flow_imp.id(1008936011101525)
,p_short_name=>'Manage Sample Data'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(215724527896528890)
,p_parent_id=>wwv_flow_imp.id(1008936011101525)
,p_short_name=>'Salary Change Approvers'
,p_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(215724711797532895)
,p_short_name=>'Employees'
,p_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(217623972726389142)
,p_short_name=>'Employees'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(223171985648917806)
,p_short_name=>'More Information'
,p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(362409570380012443)
,p_short_name=>'Laptop Order Management'
,p_link=>'f?p=&APP_ID.:19:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>19
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(363216786738936961)
,p_short_name=>'Approvals Administration'
,p_link=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(363977968037925495)
,p_short_name=>'My Approvals'
,p_link=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(364011859694961850)
,p_short_name=>'My Requests'
,p_link=>'f?p=&APP_ID.:5:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_imp.component_end;
end;
/
