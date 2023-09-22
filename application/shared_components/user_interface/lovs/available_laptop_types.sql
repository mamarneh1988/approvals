prompt --application/shared_components/user_interface/lovs/available_laptop_types
begin
--   Manifest
--     AVAILABLE_LAPTOP_TYPES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>20
,p_default_application_id=>7870
,p_default_id_offset=>321337877993430365
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(359197332070327982)
,p_lov_name=>'AVAILABLE_LAPTOP_TYPES'
,p_lov_query=>'.'||wwv_flow_imp.id(359197332070327982)||'.'
,p_location=>'STATIC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(359197610006327983)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'MacBook Pro 14"'
,p_lov_return_value=>'MAC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(359198019972327984)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Lenovo T490'
,p_lov_return_value=>'WIN'
);
wwv_flow_imp.component_end;
end;
/
