prompt --application/deployment/install/install_droptables
begin
--   Manifest
--     INSTALL: INSTALL-DropTables
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>20
,p_default_application_id=>7870
,p_default_id_offset=>321337877993430365
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(1024162065230315)
,p_install_id=>wwv_flow_imp.id(306454275574934887)
,p_name=>'DropTables'
,p_sequence=>1
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    begin',
'        execute immediate ''drop table eba_demo_appr_sal_history cascade constraints'';',
'    exception',
'        when others then',
'            if sqlcode != -942 then',
'                raise;',
'            end if;',
'    end;',
'    begin',
'        execute immediate ''drop table eba_demo_appr_emp cascade constraints'';',
'    exception',
'        when others then',
'            if sqlcode != -942 then',
'                raise;',
'            end if;                ',
'    end;',
'    begin',
'        execute immediate ''drop table eba_demo_appr_dept cascade constraints'';',
'    exception',
'        when others then',
'            if sqlcode != -942 then',
'                raise;',
'            end if;                ',
'    end;',
'    begin',
'        execute immediate ''drop table eba_demo_appr_approvers cascade constraints'';',
'    exception',
'        when others then',
'            if sqlcode != -942 then',
'                raise;',
'            end if;',
'    end;',
'    begin',
'        execute immediate ''drop table eba_demo_appr_laptop_requests cascade constraints'';',
'    exception',
'        when others then',
'            if sqlcode != -942 then',
'                raise;',
'            end if;',
'    end;    ',
'end;   ',
'/'))
);
wwv_flow_imp.component_end;
end;
/
