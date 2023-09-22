prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
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
 p_id=>11
,p_name=>'Email Settings'
,p_alias=>'EMAIL-SETTINGS'
,p_step_title=>'Email Settings'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'16'
,p_last_updated_by=>'LEORODRI'
,p_last_upd_yyyymmddhh24miss=>'20220926191707'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(310942433667510453)
,p_plug_name=>'Email Settings'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294355728737215894)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(294246200659215771)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(294417891517215966)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2365863299559757038)
,p_plug_name=>'Overview'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2:js-headingLevel-2'
,p_plug_template=>wwv_flow_imp.id(294311358452215853)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_grid_column_css_classes=>'col-sm-12'
,p_plug_source=>'<p>The Job Change task definition conditionally sends an email notification upon task completion with an Approved outcome. The email will go to the address you configure on this page as an application setting. If this setting is blank, the Job Change'
||' approval email is skipped by evaluating an application item whose value is computed from this setting.</p>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(268648095907404247)
,p_button_sequence=>30
,p_button_name=>'Save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294416203109215963)
,p_button_image_alt=>'Save'
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(268647429788404241)
,p_name=>'P11_DEMO_NOTIFICATION_EMAIL'
,p_item_sequence=>20
,p_prompt=>'Email for Demo Notification'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(294413744163215958)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(268647573839404242)
,p_computation_sequence=>10
,p_computation_item=>'P11_DEMO_NOTIFICATION_EMAIL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'apex_app_setting.get_value(''DEMO_NOTIFICATION_EMAIL'');'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(268647956963404246)
,p_validation_name=>'Valid Email'
,p_validation_sequence=>10
,p_validation=>'regexp_like (:P11_DEMO_NOTIFICATION_EMAIL, ''^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'')'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Please provide a valid email address.'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(268647634291404243)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update App Setting'
,p_process_sql_clob=>'apex_app_setting.set_value(''DEMO_NOTIFICATION_EMAIL'',:P11_DEMO_NOTIFICATION_EMAIL);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/
