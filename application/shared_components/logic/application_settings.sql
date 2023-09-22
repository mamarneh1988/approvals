prompt --application/shared_components/logic/application_settings
begin
--   Manifest
--     APPLICATION SETTINGS: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>20
,p_default_application_id=>7870
,p_default_id_offset=>321337877993430365
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_app_setting(
 p_id=>wwv_flow_imp.id(215770122503466740)
,p_name=>'DEMO_NOTIFICATION_EMAIL'
,p_is_required=>'N'
);
wwv_flow_imp.component_end;
end;
/