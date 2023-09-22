prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>20
,p_default_application_id=>7870
,p_default_id_offset=>321337877993430365
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(306454275574934887)
,p_deinstall_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DROP TABLE EBA_DEMO_APPR_EMP CASCADE CONSTRAINTS;',
'DROP TABLE EBA_DEMO_APPR_DEPT CASCADE CONSTRAINTS;',
'DROP TABLE EBA_DEMO_APPR_APPROVERS CASCADE CONSTRAINTS;',
'DROP PACKAGE EBA_DEMO_APPR;',
'DROP PACKAGE EBA_DEMO_APPR_DATA;'))
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
);
wwv_flow_imp.component_end;
end;
/
