prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
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
 p_id=>10
,p_name=>'Test Approver Assignment'
,p_alias=>'TEST-APPROVER-ASSIGNMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Test Approver Assignment'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'300'
,p_protection_level=>'C'
,p_page_component_map=>'17'
,p_last_upd_yyyymmddhh24miss=>'20220823161417'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(578705714851149511)
,p_plug_name=>'Test Salary Change Approver Assignments'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294282948967215830)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(310060683497745295)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(578705714851149511)
,p_button_name=>'Test'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294416203109215963)
,p_button_image_alt=>'Test'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(310061077331745296)
,p_name=>'P10_EMPNO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(578705714851149511)
,p_prompt=>'Empno'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename||'' [''||job||'']'', empno',
'from eba_demo_appr_emp',
'order by ename'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(294413744163215958)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(310061421034745306)
,p_name=>'P10_PROPOSED_SALARY'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(578705714851149511)
,p_prompt=>'Proposed Salary'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(294413744163215958)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(310062260510745307)
,p_name=>'P10_TEST_RESULT_APPROVER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(578705714851149511)
,p_prompt=>'Approver'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(294413744163215958)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(310062662155745307)
,p_name=>'P10_TEST_RESULT_ADMIN'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(578705714851149511)
,p_prompt=>'Admin'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_imp.id(294413744163215958)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(310068027889745329)
,p_name=>'When Test Button Clicked'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(310060683497745295)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(310068537880745332)
,p_event_id=>wwv_flow_imp.id(310068027889745329)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_demo_appr.validate_admin_and_approver(''SALARY_CHANGE'',',
'                                          :P10_EMPNO,',
'                                          :P10_PROPOSED_SALARY,',
'                                          :P10_TEST_RESULT_ADMIN,',
'                                          :P10_TEST_RESULT_APPROVER);',
''))
,p_attribute_02=>'P10_EMPNO,P10_PROPOSED_SALARY'
,p_attribute_03=>'P10_TEST_RESULT_APPROVER,P10_TEST_RESULT_ADMIN'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(218946504073396354)
,p_event_id=>wwv_flow_imp.id(310068027889745329)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.clearErrors();',
'let approver_missing = $v(''P10_TEST_RESULT_APPROVER'') === '''';',
'let admin_missing = $v(''P10_TEST_RESULT_ADMIN'') === '''';',
'let problems = [];',
'if (approver_missing) {',
'    problems.push(',
'        {',
'            "type" : "error",',
'            "location" : "page",',
'            "message": ''No salary change approver was available to assign (after excluding your username). Check Approver participant entries.''',
'        }',
'    ); ',
'}',
'if (admin_missing) {',
'    problems.push(',
'        {',
'            "type" : "error",',
'            "location" : "page",',
'            "message": ''No salary change admin was available to assign. Check Admin participant entries.''',
'        }',
'    );',
'}',
'if (problems.length > 0) {',
'    apex.message.showErrors(problems);',
'}',
''))
);
wwv_flow_imp.component_end;
end;
/
