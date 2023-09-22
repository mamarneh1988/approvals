prompt --application/shared_components/user_interface/lovs/eba_demo_conf_emp_lov
begin
--   Manifest
--     EBA_DEMO_CONF_EMP_LOV
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
 p_id=>wwv_flow_imp.id(359196486427308118)
,p_lov_name=>'EBA_DEMO_CONF_EMP_LOV'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'EBA_DEMO_APPR_EMP'
,p_return_column_name=>'EMPNO'
,p_display_column_name=>'ENAME'
,p_default_sort_column_name=>'ENAME'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
