prompt --application/pages/page_00008
begin
--   Manifest
--     PAGE: 00008
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
 p_id=>8
,p_name=>'Employees'
,p_alias=>'EMPLOYEES'
,p_step_title=>'Employees'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':root {',
'   --a-cv-item-width: 15rem;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
,p_last_updated_by=>'STEVE'
,p_last_upd_yyyymmddhh24miss=>'20221031135613'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(611188774449537217)
,p_plug_name=>'Employees'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_plug_template=>wwv_flow_imp.id(294290063204215835)
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select e.EMPNO,',
'       e.ENAME,',
'       e.JOB,',
'       e.SAL,',
'       CASE WHEN t1.task_id IS NOT NULL THEN ''Y'' ELSE ''N'' end as pending_sal_approval,',
'       CASE WHEN t2.task_id IS NOT NULL THEN ''Y'' ELSE ''N'' end as pending_job_approval,',
'       CASE WHEN r.id       IS NOT NULL THEN ''Y'' ELSE ''N'' end as pending_laptop_approval      ',
'  from EBA_DEMO_APPR_EMP e',
'  left outer join APEX_TASKS T1 ',
'    on t1.detail_pk = e.empno ',
'    and t1.application_id = :APP_ID ',
'    and t1.task_def_static_id = ''SALARY_CHANGE''',
'    and t1.state_code in (''UNASSIGNED'',''ASSIGNED'')',
'  left outer join APEX_TASKS T2 ',
'    on t2.detail_pk = e.empno ',
'    and t2.application_id = :APP_ID ',
'    and t2.task_def_static_id = ''JOB_CHANGE''',
'    and t2.state_code in (''UNASSIGNED'',''ASSIGNED'')',
'   left outer join EBA_DEMO_APPR_LAPTOP_REQUESTS R ',
'    on r.empno = e.empno and (r.status = ''PENDING'' or (r.status = ''APPROVED'' and r.delivered_date is null))',
'',
' '))
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{"orderBys":[{"key":"ENAME","expr":"ENAME"},{"key":"JOB","expr":"JOB"},{"key":"SAL","expr":"SAL DESC"}],"itemName":"P8_ORDER_BY"}'
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_show_total_row_count=>false
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(1002992291052557)
,p_region_id=>wwv_flow_imp.id(611188774449537217)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'ENAME'
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<strong>Job:</strong> &JOB.<br />',
'<strong>Salary:</strong> $&SAL.'))
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'INITIALS'
,p_icon_class_column_name=>'ENAME'
,p_icon_position=>'END'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(1003561427052560)
,p_card_id=>wwv_flow_imp.id(1002992291052557)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>10
,p_label=>'Salary'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::P4_EMPNO:&EMPNO.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-edit'
,p_action_css_classes=>'t-Button--small'
,p_is_hot=>false
,p_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_condition_expr1=>'PENDING_SAL_APPROVAL'
,p_condition_expr2=>'N'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(1004095602052582)
,p_card_id=>wwv_flow_imp.id(1002992291052557)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>20
,p_label=>'Job'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::P7_EMPNO:&EMPNO.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-edit'
,p_action_css_classes=>'t-Button--small'
,p_is_hot=>false
,p_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_condition_expr1=>'PENDING_JOB_APPROVAL'
,p_condition_expr2=>'N'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(357214174056737138)
,p_card_id=>wwv_flow_imp.id(1002992291052557)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>30
,p_label=>'Laptop'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:16:P16_EMPNO:&EMPNO.'
,p_button_display_type=>'TEXT_WITH_ICON'
,p_icon_css_classes=>'fa-laptop'
,p_action_css_classes=>'t-Button--small'
,p_is_hot=>false
,p_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_condition_expr1=>'PENDING_LAPTOP_APPROVAL'
,p_condition_expr2=>'N'
,p_exec_cond_for_each_row=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(611190297085537222)
,p_plug_name=>'Breadcrumb'
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
 p_id=>wwv_flow_imp.id(1292401535733932426)
,p_plug_name=>'Overview'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2:js-headingLevel-2'
,p_plug_template=>wwv_flow_imp.id(294311358452215853)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_grid_column_css_classes=>'col-sm-12'
,p_plug_source=>'<p>This page shows all employees and allows a user to initiate a job change request, a salary change request, or a laptop request by clicking the appropriate button on an employee''s card. If a job or salary change for an employee is already awaiting '
||'approval, its respective button is not shown. Similarly if a laptop request approval is pending or an approved request still has no delivered date, then the laptop button is not shown for that employee. The order by page item lets the user choose to '
||'sort by Name, Job, or Salary.</p>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1004696948052582)
,p_name=>'P8_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(611188774449537217)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'ENAME'
,p_prompt=>'Order By'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Name;ENAME,Job;JOB,Salary;SAL'
,p_cHeight=>1
,p_tag_css_classes=>'mnw160'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(294413443239215954)
,p_item_css_classes=>'u-pullRight'
,p_item_icon_css_classes=>'fa-sort-amount-desc'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1005409151052599)
,p_name=>'On Modal Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1005907894052614)
,p_event_id=>wwv_flow_imp.id(1005409151052599)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(611188774449537217)
);
wwv_flow_imp.component_end;
end;
/
