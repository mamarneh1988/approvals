prompt --application/pages/page_00007
begin
--   Manifest
--     PAGE: 00007
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
 p_id=>7
,p_name=>'Request Job Change'
,p_alias=>'REQUEST-JOB-CHANGE'
,p_page_mode=>'MODAL'
,p_step_title=>'Request Job Change'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'300'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_upd_yyyymmddhh24miss=>'20220823161417'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(596345471919333871)
,p_plug_name=>'Request Job Change'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294282948967215830)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_APPR_EMP'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(596352022688333899)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294285750039215831)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(298553463025479812)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(596352022688333899)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294416203109215963)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(298553769277479823)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(596352022688333899)
,p_button_name=>'SUBMIT_FOR_APPROVAL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294416203109215963)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'NEXT'
,p_button_condition=>'P7_EMPNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(298549853794479788)
,p_name=>'P7_EMPNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(596345471919333871)
,p_item_source_plug_id=>wwv_flow_imp.id(596345471919333871)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Empno'
,p_source=>'EMPNO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(294413744163215958)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(298550264584479799)
,p_name=>'P7_ENAME'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(596345471919333871)
,p_item_source_plug_id=>wwv_flow_imp.id(596345471919333871)
,p_prompt=>'Ename'
,p_source=>'ENAME'
,p_source_type=>'REGION_SOURCE_COLUMN'
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
 p_id=>wwv_flow_imp.id(298550606845479799)
,p_name=>'P7_JOB'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(596345471919333871)
,p_item_source_plug_id=>wwv_flow_imp.id(596345471919333871)
,p_prompt=>'Current Job'
,p_source=>'JOB'
,p_source_type=>'REGION_SOURCE_COLUMN'
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
 p_id=>wwv_flow_imp.id(298551058408479799)
,p_name=>'P7_PROPOSED_JOB'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(596345471919333871)
,p_prompt=>'Proposed Job'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct job dv, job rv from eba_demo_appr_emp',
'where job != :P7_JOB',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(294413744163215958)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(298554929684479859)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(298553463025479812)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(298555483623479862)
,p_event_id=>wwv_flow_imp.id(298554929684479859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(298552772247479811)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(596345471919333871)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Request Salary Change'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(298554186201479857)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CREATE_TASK'
,p_process_name=>'Submit Task'
,p_attribute_01=>wwv_flow_imp.id(298543841855392967)
,p_attribute_05=>'P7_EMPNO'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(298553769277479823)
);
wwv_flow_imp_shared.create_task_def_comp_param(
 p_id=>wwv_flow_imp.id(268644424276404211)
,p_page_id=>7
,p_task_def_param_id=>wwv_flow_imp.id(298545944535406913)
,p_page_process_id=>wwv_flow_imp.id(298554186201479857)
,p_value_type=>'ITEM'
,p_value=>'P7_PROPOSED_JOB'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(298554590806479859)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SUBMIT_FOR_APPROVAL,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(298552333113479804)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(596345471919333871)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Request Salary Change'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/
