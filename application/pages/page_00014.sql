prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>20
,p_default_application_id=>7870
,p_default_id_offset=>321337877993430365
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_page.create_page(
 p_id=>14
,p_name=>'More Information'
,p_alias=>'MORE-INFORMATION'
,p_step_title=>'More Information'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'11'
,p_last_updated_by=>'STEVE'
,p_last_upd_yyyymmddhh24miss=>'20221101080626'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(186002267014861862)
,p_plug_name=>'Overview'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2:js-headingLevel-2'
,p_plug_template=>wwv_flow_imp.id(294311358452215853)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    The <em>Sample Approvals</em> application illustrates the key functionality',
'    of the Oracle APEX Approvals components. The app lets users change an employee''s',
'    salary or job as well as request a laptop for them, after getting the approval',
'    of an appropriate individual. ',
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(218946616385396355)
,p_plug_name=>'More Information'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(294353114462215893)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_grid_column_css_classes=>'col-sm-12'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(218946763022396356)
,p_plug_name=>'About the Sample Application'
,p_parent_plug_id=>wwv_flow_imp.id(218946616385396355)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294284314976215830)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source_type=>'PLUGIN_MARKDOWN_REGION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'APP_STATIC_FILE'
,p_attribute_03=>'AboutTheSampleApplication.md.txt'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(223172241459917807)
,p_plug_name=>'About the Approvals Features'
,p_parent_plug_id=>wwv_flow_imp.id(218946616385396355)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294284314976215830)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source_type=>'PLUGIN_MARKDOWN_REGION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'APP_STATIC_FILE'
,p_attribute_03=>'AboutTheApprovalsFeature.md.txt'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(223171622445917805)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294355728737215894)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(294246200659215771)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(294417891517215966)
);
wwv_flow_imp.component_end;
end;
/
