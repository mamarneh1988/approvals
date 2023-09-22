prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Request Laptop'
,p_alias=>'REQUEST-LAPTOP'
,p_page_mode=>'MODAL'
,p_step_title=>'Request Laptop'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.items.P16_NEED_BY.dayFormatter = function (pDateISOString) {',
'  const day = apex.date.parse(pDateISOString, "YYYY-MM-DD").getDay();',
'  return {',
'      // disable when day is Saturday or Sunday',
'      disabled: [0, 6].includes(day),',
'      // set a styling css class like u-danger-text',
'      class: null,',
'      // set a tooltip that is shown on hover',
'      tooltip: null',
'  };',
'};',
'apex.items.P16_NEED_BY.refresh();'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'340'
,p_protection_level=>'C'
,p_page_component_map=>'02'
,p_last_updated_by=>'STEVE'
,p_last_upd_yyyymmddhh24miss=>'20221121155423'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(970736411946855925)
,p_plug_name=>'Request Laptop'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294282948967215830)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_APPR_LAPTOP_REQUESTS'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(970742962715855953)
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
 p_id=>wwv_flow_imp.id(357209701876733220)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(970742962715855953)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294416203109215963)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(357210151415733222)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(970742962715855953)
,p_button_name=>'SUBMIT_FOR_APPROVAL'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294416203109215963)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_button_position=>'NEXT'
,p_button_condition=>'P16_EMPNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(357205452181733211)
,p_name=>'P16_EMPNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(970736411946855925)
,p_item_source_plug_id=>wwv_flow_imp.id(970736411946855925)
,p_prompt=>'Employee'
,p_source=>'EMPNO'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_named_lov=>'EBA_DEMO_CONF_EMP_LOV'
,p_field_template=>wwv_flow_imp.id(294413744163215958)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_attribute_02=>'LOV'
,p_attribute_04=>'Y'
,p_attribute_05=>'PLAIN'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(357213565957737131)
,p_name=>'P16_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(970736411946855925)
,p_item_source_plug_id=>wwv_flow_imp.id(970736411946855925)
,p_source=>'ID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(357214073491737136)
,p_name=>'P16_LAPTOP_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(970736411946855925)
,p_item_source_plug_id=>wwv_flow_imp.id(970736411946855925)
,p_item_default=>'MAC'
,p_prompt=>'Laptop Type'
,p_source=>'LAPTOP_TYPE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'AVAILABLE_LAPTOP_TYPES'
,p_lov=>'.'||wwv_flow_imp.id(359197332070327982)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(294413744163215958)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(357215029189737146)
,p_name=>'P16_NEED_BY'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(970736411946855925)
,p_item_source_plug_id=>wwv_flow_imp.id(970736411946855925)
,p_prompt=>'Need By'
,p_format_mask=>'YYYYMMDDHH24MI'
,p_source=>'NEED_BY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(294413744163215958)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'INLINE'
,p_attribute_03=>'ITEM'
,p_attribute_05=>'P16_MINIMUM_DATE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'MONTH-PICKER'
,p_attribute_13=>'VISIBLE'
,p_attribute_15=>'FOCUS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(357215080719737147)
,p_name=>'P16_MINIMUM_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(970736411946855925)
,p_format_mask=>'YYYYMMDDHH24MI'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(357215174406737148)
,p_computation_sequence=>10
,p_computation_item=>'P16_MINIMUM_DATE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'SQL'
,p_computation=>'to_char((sysdate + 7) + case to_char(sysdate + 7, ''fmDay'',''NLS_DATE_LANGUAGE = AMERICAN'') when ''Saturday'' then 2 when ''Sunday'' then 1 else 0 end,''YYYYMMDDHH24MI'') min_date'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(357215294800737149)
,p_computation_sequence=>20
,p_computation_item=>'P16_NEED_BY'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'SQL'
,p_computation=>'to_char((sysdate + 14) + case to_char(sysdate + 14, ''fmDay'',''NLS_DATE_LANGUAGE = AMERICAN'') when ''Saturday'' then 2 when ''Sunday'' then 1 else 0 end,''YYYYMMDDHH24MI'') min_date'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(357212488411733234)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(357209701876733220)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(357212996270733236)
,p_event_id=>wwv_flow_imp.id(357212488411733234)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(357208989379733219)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(970736411946855925)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Request Laptop'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(357211329551733227)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CREATE_TASK'
,p_process_name=>'Submit Task'
,p_attribute_01=>wwv_flow_imp.id(353594115780845834)
,p_attribute_05=>'P16_ID'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(357210151415733222)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(357212265736733233)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SUBMIT_FOR_APPROVAL,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(357208661685733218)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(970736411946855925)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Request Salary Change'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/
