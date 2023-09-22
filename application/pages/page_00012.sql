prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
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
 p_id=>12
,p_name=>'Pending Approvals'
,p_alias=>'PENDING-APPROVALS'
,p_step_title=>'Pending Approvals'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.actions.add([',
'{',
'  name: "handle-task-deadlines-action",',
'  action: function( event, element, args)',
'  {',
'    // Trigger custom event to perform the server-side call',
'    $("body").trigger("handle-task-deadlines-event");',
'  }',
'},',
'{',
'  name: "refresh-action",',
'  action: function( event, element, args)',
'  {',
'    // Trigger custom event to perform the refresh',
'    $("body").trigger("refresh-event");',
'  }',
'}',
'])'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
,p_last_updated_by=>'STEVE'
,p_last_upd_yyyymmddhh24miss=>'20221101113430'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1226398741196947)
,p_plug_name=>'Pending Approvals'
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1227049746196963)
,p_name=>'Pending Approvals'
,p_template=>wwv_flow_imp.id(294343348039215884)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.task_id, ',
'       t.subject,',
'       t.priority,',
'       t.initiator,',
'       case ',
'            when t.state_code = ''ASSIGNED'' then ',
'                t.state||'' to ''||t.actual_owner',
'            when t.state_code = ''UNASSIGNED'' then ',
'                t.state||'' (''||eba_demo_appr.approvers_for_task(t.task_id)||'')''',
'            when t.state_code = ''EXPIRED'' then',
'                ''Expired after ''||',
unistr('                (select listagg(t3.actual_owner,''\2190'')'),
'                   from apex_tasks t3',
'                   connect by prior t3.previous_task_id = t3.task_id',
'                   start with t3.task_id = t.task_id)',
'        end status,',
'        eba_demo_appr.admins_for_task(t.task_id) as admins,',
'        t.due_on due_by,',
'        eba_demo_appr.details_task_url(',
'          p_url     => d.details_link_target,',
'          p_app_id  => d.application_id,',
'          p_task_id => t.task_id) details_link_target,',
'       due_in, ',
'       case ',
'          when due_in_hours <   0 then ''OVERDUE''',
'          when due_in_hours <   1 then ''NEXT_HOUR''',
'          when due_in_hours <  24 then ''NEXT_24_HOURS''',
'          when due_in_hours < 168 then ''NEXT_7_DAYS''',
'          when due_in_hours < 720 then ''NEXT_30_DAYS''',
'          else            ''MORE_THAN_30_DAYS''',
'      end due_code,',
'      case when state_code in (''COMPLETED'', ''CANCELED'') ',
'                                               then ''Y''',
'                                               else ''N''',
'                                          end is_completed         ',
'from (',
'select task_id,',
'       task_def_id,',
'       subject,',
'       priority,',
'       initiator,',
'       actual_owner,',
'       due_on,',
'       apex_util.get_since(due_on) due_in,',
'       round((cast(due_on as date) - sysdate) * 24, 1) due_in_hours,',
'       state_code,',
'       state',
'       from apex_Tasks',
') t',
'left join apex_appl_taskdefs d on d.task_def_id = t.task_def_id',
'where (t.state_code in (''UNASSIGNED'',''ASSIGNED'')',
'      or',
'      (',
'          t.state_code = ''EXPIRED'' ',
'           and not exists (select 1 ',
'                             from apex_tasks t2 ',
'                            where previous_task_id = t.task_id)',
'      )',
'      )',
'order by due_by'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(294381220381215917)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No pending approvals'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1227381893196979)
,p_query_column_id=>1
,p_column_alias=>'TASK_ID'
,p_column_display_sequence=>1
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(996526440011442)
,p_query_column_id=>2
,p_column_alias=>'SUBJECT'
,p_column_display_sequence=>11
,p_column_heading=>'Subject'
,p_use_as_row_header=>'N'
,p_column_link=>'#DETAILS_LINK_TARGET#'
,p_column_linktext=>'#SUBJECT#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(996619719011443)
,p_query_column_id=>3
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>21
,p_column_heading=>'Priority'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(367401494836623134)
,p_query_column_id=>4
,p_column_alias=>'INITIATOR'
,p_column_display_sequence=>31
,p_column_heading=>'Requester'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(996755310011444)
,p_query_column_id=>5
,p_column_alias=>'STATUS'
,p_column_display_sequence=>41
,p_column_heading=>'Status'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(218946085537396350)
,p_query_column_id=>6
,p_column_alias=>'ADMINS'
,p_column_display_sequence=>51
,p_column_heading=>'Admins'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(996934167011446)
,p_query_column_id=>7
,p_column_alias=>'DUE_BY'
,p_column_display_sequence=>61
,p_column_heading=>'Due'
,p_use_as_row_header=>'N'
,p_column_format=>'DD-MON-YYYY HH24:MI'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if !IS_COMPLETED/}',
'    {case DUE_CODE/}',
'        {when OVERDUE/}',
'            <strong class="u-danger-text">#DUE_IN#</strong>',
'        {when NEXT_HOUR/}',
'            <strong class="u-danger-text">#DUE_IN#</strong>',
'        {when NEXT_24_HOURS/}',
'            <span class="u-danger-text">#DUE_IN#</span>',
'        {otherwise/}',
'            {if DUE_IN/}<span>#DUE_IN#</span>{endif/}',
'    {endcase/}',
'{endif/} '))
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(198958999266014433)
,p_query_column_id=>8
,p_column_alias=>'DETAILS_LINK_TARGET'
,p_column_display_sequence=>71
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(357214676447737143)
,p_query_column_id=>9
,p_column_alias=>'DUE_IN'
,p_column_display_sequence=>81
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(357214867894737144)
,p_query_column_id=>10
,p_column_alias=>'DUE_CODE'
,p_column_display_sequence=>91
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(357214944557737145)
,p_query_column_id=>11
,p_column_alias=>'IS_COMPLETED'
,p_column_display_sequence=>101
,p_use_as_row_header=>'N'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(357215411515737150)
,p_plug_name=>'Handle Deadlines and Refresh'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md'
,p_plug_template=>wwv_flow_imp.id(294284314976215830)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'An hourly job handles task deadlines, but you can ',
'<a href="#action$handle-task-deadlines-action">handle them now</a>',
'or just',
'<a href="#action$refresh-action">update the list</a>.',
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2902595936615774438)
,p_plug_name=>'About this page'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(294301809631215843)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_grid_column_css_classes=>'col-sm-12'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    This page is handy for demo purposes since it shows the relevant approvers and administrators',
'    determined at task creation time for each pending approval task. Use this information',
'    to know which sample user to log in as to approve or administer a given task. The Job Change',
'    task definition configures its participants at design time. The Salary Change task',
'    definition dynamically computes its participants at runtime by calling a PL/SQL function.',
'    The Laptop Request task definition also configures its participants at runtime by calling',
'    a PL/SQL function, passing the <tt>:APEX$TASK_RENEWAL_COUNT</tt> bind variable value as a parameter so',
'    the number of times the task has been renewed can factor into the assignment. ',
'    Since by design the same user cannot approve a task they initiated, even if the current user',
'    <em>would</em> technically be a valid "potential owner" participant, their username won''t',
'    appear as an approver on a job or salary request they created. ',
'</p>',
'<p>',
'    This page''s classic report region queries data from <strong>APEX_TASKS</strong>, ',
'    <strong>APEX_TASK_PARTICIPANTS</strong>, and ',
'    <strong>APEX_APPL_TASKDEFS</strong> views. Most applications using approvals ',
'    would typically only need one or more of the unified task list pages to allow',
'    end users to work with tasks. This sample includes <strong>My Approvals</strong>, ',
'    <strong>My Requests</strong>, and <strong>Approvals Administration</strong>',
'    unified task list pages for that purpose. ',
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(357214458401737140)
,p_name=>'Handle Task Deadlines'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'handle-task-deadlines-event'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(357214536195737141)
,p_event_id=>wwv_flow_imp.id(357214458401737140)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Handle Task Deadlines'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'apex_approval.handle_task_deadlines;'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(357214662898737142)
,p_event_id=>wwv_flow_imp.id(357214458401737140)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Pending Tasks'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1227049746196963)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(367401178131623131)
,p_name=>'Refresh Task List'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'refresh-event'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(367401336345623132)
,p_event_id=>wwv_flow_imp.id(367401178131623131)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1227049746196963)
);
wwv_flow_imp.component_end;
end;
/
