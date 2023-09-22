prompt --application/shared_components/email/templates/job_change_notification
begin
--   Manifest
--     REPORT LAYOUT: Job Change Notification
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>20
,p_default_application_id=>7870
,p_default_id_offset=>321337877993430365
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_email_template(
 p_id=>wwv_flow_imp.id(310944013143552178)
,p_name=>'Job Change Notification'
,p_static_id=>'JOB_CHANGE_NOTIFICATION'
,p_version_number=>2
,p_subject=>'Job Change for #P_ENAME# Completed'
,p_html_body=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Hello,<br>',
'The job change for #P_ENAME# from #P_JOB_BEFORE# to #P_JOB_AFTER# has been approved and is now complete.'))
,p_html_header=>'<b style="font-size: 24px;">Sample Approvals</b>'
);
wwv_flow_imp.component_end;
end;
/
