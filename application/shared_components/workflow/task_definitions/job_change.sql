prompt --application/shared_components/workflow/task_definitions/job_change
begin
--   Manifest
--     TASK_DEF: Job Change
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>20
,p_default_application_id=>7870
,p_default_id_offset=>321337877993430365
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_task_def(
 p_id=>wwv_flow_imp.id(298543841855392967)
,p_name=>'Job Change'
,p_static_id=>'JOB_CHANGE'
,p_subject=>'Job Change for &INITCAP_ENAME. from &JOB. to &P_NEW_JOB.'
,p_priority=>3
,p_due_on_interval=>'P2D'
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_due_on_type=>'INTERVAL'
,p_details_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2:P2_TASK_ID:&TASK_ID.'
,p_actions_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename, job, initcap(ename) as initcap_ename, ',
'       apex_app_setting.get_value(''DEMO_NOTIFICATION_EMAIL'') as demo_notification_email',
'from eba_demo_appr_emp where empno = :APEX$TASK_PK'))
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(298545944535406913)
,p_task_def_id=>wwv_flow_imp.id(298543841855392967)
,p_label=>'New Job'
,p_static_id=>'P_NEW_JOB'
,p_data_type=>'VARCHAR2'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(215764499161396706)
,p_task_def_id=>wwv_flow_imp.id(298543841855392967)
,p_name=>'Push Email Queue for Sample'
,p_execution_sequence=>30
,p_outcome=>'APPROVED'
,p_on_event=>'COMPLETE'
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>'apex_mail.push_queue;'
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
,p_condition_type=>'ITEM_IS_NOT_NULL'
,p_condition_expr1=>'DEMO_NOTIFICATION_EMAIL'
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(298546323605445647)
,p_task_def_id=>wwv_flow_imp.id(298543841855392967)
,p_name=>'On Approve'
,p_execution_sequence=>10
,p_outcome=>'APPROVED'
,p_on_event=>'COMPLETE'
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>'update eba_demo_appr_emp set job = :P_NEW_JOB where empno = :APEX$TASK_PK;'
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(310941427132484154)
,p_task_def_id=>wwv_flow_imp.id(298543841855392967)
,p_name=>'Notify Employee'
,p_execution_sequence=>20
,p_outcome=>'APPROVED'
,p_on_event=>'COMPLETE'
,p_action_type=>'NATIVE_SEND_EMAIL'
,p_attribute_01=>'&APP_EMAIL.'
,p_attribute_02=>'&DEMO_NOTIFICATION_EMAIL.'
,p_attribute_10=>'N'
,p_attribute_11=>wwv_flow_imp.id(310944013143552178)
,p_attribute_12=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'    "P_JOB_BEFORE":"&JOB.",',
'    "P_JOB_AFTER":"&P_NEW_JOB.",',
'    "P_ENAME":"&ENAME."',
'}'))
,p_attribute_14=>'HTML'
,p_location=>'LOCAL'
,p_stop_execution_on_error=>true
,p_condition_type=>'EXPRESSION'
,p_condition_expr1=>'apex_app_setting.get_value(''DEMO_NOTIFICATION_EMAIL'') is not null'
,p_condition_expr2=>'PLSQL'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(298544352393406910)
,p_task_def_id=>wwv_flow_imp.id(298543841855392967)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'JANE'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(298544788962406911)
,p_task_def_id=>wwv_flow_imp.id(298543841855392967)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'STEVE'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(298545171255406911)
,p_task_def_id=>wwv_flow_imp.id(298543841855392967)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'BO'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(298545513828406912)
,p_task_def_id=>wwv_flow_imp.id(298543841855392967)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'STATIC'
,p_value=>'PAT'
);
wwv_flow_imp.component_end;
end;
/
