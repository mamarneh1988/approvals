prompt --application/shared_components/user_interface/lovs/distinct_job_codes_lov
begin
--   Manifest
--     DISTINCT_JOB_CODES_LOV
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
 p_id=>wwv_flow_imp.id(309965586131980590)
,p_lov_name=>'DISTINCT_JOB_CODES_LOV'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select job dv, job rv',
'from (',
'    select distinct job from eba_demo_appr_emp',
')',
'order by job'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_return_column_name=>'RV'
,p_display_column_name=>'DV'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'DV'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
