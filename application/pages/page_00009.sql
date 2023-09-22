prompt --application/pages/page_00009
begin
--   Manifest
--     PAGE: 00009
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
 p_id=>9
,p_name=>'Approvers'
,p_alias=>'APPROVERS'
,p_step_title=>'Approvers'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
,p_last_updated_by=>'STEVE'
,p_last_upd_yyyymmddhh24miss=>'20221101091159'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(268648159910404248)
,p_plug_name=>'Salary Change Approvers'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294355728737215894)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(294246200659215771)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(294417891517215966)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(578696042291140766)
,p_plug_name=>'Tips'
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark'
,p_plug_template=>wwv_flow_imp.id(294277700659215821)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>' <p>Task approvers and administrators are determined for each task at creation time. You can query a task''s participants using the <strong>APEX_TASK_PARTICIPANTS</strong> view. Changes you make here affect the approvers and admins for <em>new</em> ta'
||'sks created after that.</p>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(268647327883404240)
,p_plug_name=>'New'
,p_parent_plug_id=>wwv_flow_imp.id(578696042291140766)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294282948967215830)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(618112042846001647)
,p_plug_name=>'Approvers'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294338731653215881)
,p_plug_display_sequence=>30
,p_query_type=>'TABLE'
,p_query_table=>'EBA_DEMO_APPR_APPROVERS'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_page_header=>'Approvers'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(268647159160404238)
,p_name=>'MIN_SALARY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MIN_SALARY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Only Requests Above (Min Salary)'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(618113266706001669)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(618113730668001677)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Actions'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(618114747667001686)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(618115780937001688)
,p_name=>'USERNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USERNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Username'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_attribute_06=>'UPPER'
,p_is_required=>true
,p_max_length=>200
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'UPPER'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(618116737609001689)
,p_name=>'TASK_DEF_STATIC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TASK_DEF_STATIC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'SALARY_CHANGE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(618117738487001690)
,p_name=>'JOB_CODES'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOB_CODES'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Only For Job Codes'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'Y'
,p_attribute_04=>'N'
,p_attribute_05=>'N'
,p_attribute_07=>'Chose one or more job codes'
,p_attribute_11=>':'
,p_is_required=>false
,p_max_length=>200
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(309965586131980590)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(618118807087001692)
,p_name=>'PARTICIPANT_ROLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTICIPANT_ROLE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Participant Role'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Approver;APPROVER,Admin;ADMIN'
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(618112625439001654)
,p_internal_uid=>618112625439001654
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(618112849522001660)
,p_interactive_grid_id=>wwv_flow_imp.id(618112625439001654)
,p_static_id=>'3080628'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(618113033062001667)
,p_report_id=>wwv_flow_imp.id(618112849522001660)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(310460790481266437)
,p_view_id=>wwv_flow_imp.id(618113033062001667)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(268647159160404238)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(618114226260001678)
,p_view_id=>wwv_flow_imp.id(618113033062001667)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(618113730668001677)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(618115203709001687)
,p_view_id=>wwv_flow_imp.id(618113033062001667)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(618114747667001686)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(618116144504001689)
,p_view_id=>wwv_flow_imp.id(618113033062001667)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(618115780937001688)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(618117207674001690)
,p_view_id=>wwv_flow_imp.id(618113033062001667)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(618116737609001689)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(618118223701001691)
,p_view_id=>wwv_flow_imp.id(618113033062001667)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(618117738487001690)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(618119201144001692)
,p_view_id=>wwv_flow_imp.id(618113033062001667)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(618118807087001692)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1829131916449760613)
,p_plug_name=>'About this page'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(294301809631215843)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_css_classes=>'col-sm-12'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>While the approvers for job changes are configured at design time, salary change approvers are determined at runtime based on the information shown on this page. Users listed here must have a participant role of <strong>Approver</strong> or <stron'
||'g>Admin</strong>, and optionally can be associated with a comma-separated list of job codes and minimum proposed salary value used by the approver and admin assignment business logic. After saving any edits you''ve made, click <strong>Test Salary Appr'
||'over Assignment...</strong> to proactively test the salary change approver assignments that will be used the next time a Salary Change task is created.</p>',
'<p>',
'   <ul>',
'      <li>',
'        The <i>Salary Change</i> task definition calls <strong>eba_demo_appr.get_approver_for()</strong>',
'        to determine the list of approvers, passing employee number, job, and',
'        proposed salary as bind variables.',
'      </li>',
'      <li>It calls the <strong>eba_demo_appr.get_admin_for()</strong>',
'         to determine the list of business admins for the task.',
'      </li>',
'      <li>',
'        These functions query the <strong>EBA_DEMO_APPR_APPROVERS</strong> table whose',
'          rows are editable below.',
'      </li>',
'      <li>',
'          They first find rows whose <strong>JOB_CODES</strong> value contains the job value',
'          passed in (ignoring ones whose <strong>MIN_SALARY</strong> is higher than the',
'          proposed salary.',
'      </li>',
'      <li>',
'         If none exist, participants with null <strong>JOB_CODES</strong> are used instead.',
'      </li>',
'      <li>',
'          Multiple participants are returned as comma-separated list of usernames.</p>',
'      </li>',
'      <li>',
'        Task participants <em>could</em> also be determined by using a SQL',
'          Query that returns one row per username.',
'      </li>',
'    </ul>',
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(268647007739404237)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(268647327883404240)
,p_button_name=>'TEST_ASSIGNMENT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(294416203109215963)
,p_button_image_alt=>'Test Salary Approver Assignment...'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(310057508827736652)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(618112042846001647)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Approvers - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/
