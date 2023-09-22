prompt --application/shared_components/workflow/task_definitions/salary_change
begin
--   Manifest
--     TASK_DEF: Salary Change
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
 p_id=>wwv_flow_imp.id(297740972689777133)
,p_name=>'Salary Change'
,p_static_id=>'SALARY_CHANGE'
,p_subject=>'Salary Change for &INITCAP_ENAME. from &SAL. to &P_NEW_SALARY.'
,p_priority=>3
,p_due_on_interval=>'P7D'
,p_expiration_policy=>'NONE'
,p_max_renewal_count=>3
,p_due_on_type=>'INTERVAL'
,p_details_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:RP,15:P15_TASK_ID:&TASK_ID.'
,p_actions_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ename, sal, initcap(ename) as initcap_ename, job',
'from eba_demo_appr_emp where empno = :APEX$TASK_PK'))
);
wwv_flow_imp_shared.create_task_def_param(
 p_id=>wwv_flow_imp.id(297742956796787255)
,p_task_def_id=>wwv_flow_imp.id(297740972689777133)
,p_label=>'Proposed Salary'
,p_static_id=>'P_NEW_SALARY'
,p_data_type=>'NUMBER'
,p_is_required=>true
,p_is_visible=>true
);
wwv_flow_imp_shared.create_task_def_action(
 p_id=>wwv_flow_imp.id(297743330151836129)
,p_task_def_id=>wwv_flow_imp.id(297740972689777133)
,p_name=>'On Approve'
,p_execution_sequence=>1
,p_outcome=>'APPROVED'
,p_on_event=>'COMPLETE'
,p_action_type=>'NATIVE_PLSQL'
,p_action_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into eba_demo_appr_sal_history(empno,old_sal,new_sal,task_id,approval_date) ',
'select empno, sal, :P_NEW_SALARY, :APEX$TASK_ID, sysdate from eba_demo_appr_emp where empno = :APEX$TASK_PK;',
'update eba_demo_appr_emp set sal = :P_NEW_SALARY where empno = :APEX$TASK_PK;',
''))
,p_action_clob_language=>'PLSQL'
,p_location=>'LOCAL'
,p_success_message=>'Salary change approved'
,p_stop_execution_on_error=>true
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(297741365473787246)
,p_task_def_id=>wwv_flow_imp.id(297740972689777133)
,p_participant_type=>'BUSINESS_ADMIN'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'eba_demo_appr.get_admin_for(''SALARY_CHANGE'', :APEX$TASK_PK, :JOB, :P_NEW_SALARY)'
);
wwv_flow_imp_shared.create_task_def_participant(
 p_id=>wwv_flow_imp.id(297741742709787254)
,p_task_def_id=>wwv_flow_imp.id(297740972689777133)
,p_participant_type=>'POTENTIAL_OWNER'
,p_identity_type=>'USER'
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'eba_demo_appr.get_approver_for(''SALARY_CHANGE'', :APEX$TASK_PK, :JOB, :P_NEW_SALARY)'
);
wwv_flow_imp.component_end;
end;
/
