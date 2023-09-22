prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Home'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'div.featuredBlock{',
'	-webkit-border-radius:3px;',
'	-moz-border-radius:3px;',
'	border-radius:3px;',
'	-webkit-box-shadow:0 1px 2px rgba(0,0,0,0.05);',
'	-moz-box-shadow:0 1px 2px rgba(0,0,0,0.05);',
'	box-shadow:0 1px 2px rgba(0,0,0,0.05);',
'	border:1px solid #E1E6EB;',
'	margin-bottom:18px',
'}',
'div.featuredBlock div.featuredIcon{',
'	background-image:url(''data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPb'
||'lVzZSIgeDE9IjUwJSIgeTE9IjAlIiB4Mj0iNTAlIiB5Mj0iMTAwJSI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZmZmZmZiIvPjxzdG9wIG9mZnNldD0iNDAlIiBzdG9wLWNvbG9yPSIjZmZmZmZmIi8+PHN0b3Agb2Zmc2V0PSI2MCUiIHN0b3AtY29sb3I9IiNmNGY0ZjgiLz48c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3A'
||'tY29sb3I9IiNmZmZmZmYiLz48L2xpbmVhckdyYWRpZW50PjwvZGVmcz48cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiBmaWxsPSJ1cmwoI2dyYWQpIiAvPjwvc3ZnPiA='');',
'	background-size:100%;',
'	background-image:-webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #ffffff), color-stop(40%, #ffffff), color-stop(60%, #f4f4f8), color-stop(100%, #ffffff));',
'	background-image:-webkit-linear-gradient(top, #ffffff 0%,#ffffff 40%,#f4f4f8 60%,#ffffff 100%);',
'	background-image:-moz-linear-gradient(top, #ffffff 0%,#ffffff 40%,#f4f4f8 60%,#ffffff 100%);',
'	background-image:linear-gradient(top, #ffffff 0%,#ffffff 40%,#f4f4f8 60%,#ffffff 100%);',
'	-webkit-border-radius:3px 3px 0 0;',
'	-moz-border-radius:3px 3px 0 0;',
'	border-radius:3px 3px 0 0;',
'	padding:8px 0;',
'	min-height: 90px;',
'	text-align:center;',
'}',
'div.featuredBlock div.featuredIcon img{',
'	display:block;',
'	margin:0 auto 0 auto;',
'	-webkit-box-reflect:below -20px -webkit-gradient(linear, left top, left bottom, from(transparent), color-stop(65%, transparent), to(rgba(255,255,255,0.2)));',
'}',
'div.featuredBlock div.featuredIcon h1{',
'	font-size:12px;',
'	line-height:12px;',
'	color:#404040;',
'	margin:0 8px;',
'	padding:0;',
'	text-align:center;',
'}',
'a.blockLink,a.blockLink:hover{',
'	text-decoration:none',
'}',
'a.blockLink:hover div.featuredBlock{',
'	border:1px solid #b1bbcb',
'}',
'a.blockLink:hover div.featuredBlock div.featuredIcon{',
'	background: none #e5effb;',
'	-webkit-box-shadow: 0 0 10px rgba(50,117,199,0.25);',
'	-moz-box-shadow: 0 0 10px rgba(50,117,199,0.25);',
'	box-shadow: 0 0 10px rgba(50,117,199,0.25);',
'}',
'.regionDivider {',
'	border-top: 2px solid #F0F0F0 !important;',
'	padding-top: 8px;;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
,p_last_updated_by=>'STEVE'
,p_last_upd_yyyymmddhh24miss=>'20221101080850'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(218944198071396331)
,p_plug_name=>'Additional Setup Required'
,p_region_css_classes=>'mxw800'
,p_icon_css_classes=>'fa-exclamation-triangle fa-lg u-danger-text'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h2'
,p_plug_template=>wwv_flow_imp.id(294311358452215853)
,p_plug_display_sequence=>40
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P1_MISSING_ACCOUNTS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(751144652239608839)
,p_plug_name=>'Users Missing'
,p_parent_plug_id=>wwv_flow_imp.id(218944198071396331)
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--horizontal:t-Alert--noIcon:t-Alert--warning:t-Alert--removeHeading js-removeLandmark'
,p_plug_template=>wwv_flow_imp.id(294277700659215821)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'<p>The following required sample user account(s) are missing: <strong>&P1_MISSING_ACCOUNTS.</strong></p>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P1_MISSING_ACCOUNTS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(535676677061643031)
,p_plug_name=>'Ask Admin to Create Users'
,p_parent_plug_id=>wwv_flow_imp.id(751144652239608839)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294282948967215830)
,p_plug_display_sequence=>30
,p_plug_source=>'<p>Please ask your workspace administrator to create these user accounts.</p>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null from dual',
'where not exists (select column_value',
'from table(apex_string.split(apex_util.get_user_roles(p_username=>:APP_USER),'':''))',
'where column_value = ''ADMIN'')',
'and (apex_util.get_email(''STEVE'') is null',
'    or apex_util.get_email(''PAT'') is null',
'    or apex_util.get_email(''BO'') is null',
'    or apex_util.get_email(''JANE'') is null)'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(751144415161608837)
,p_plug_name=>'Use Administration to Create Missing Users'
,p_parent_plug_id=>wwv_flow_imp.id(751144652239608839)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294282948967215830)
,p_plug_display_sequence=>20
,p_plug_source=>'<p>Please use the Oracle APEX Builder''s <strong>Administration</strong> > <strong>Manage Users and Groups</strong> to create the missing user accounts.</p>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null from dual',
'where exists (select column_value',
'from table(apex_string.split(apex_util.get_user_roles(p_username=>:APP_USER),'':''))',
'where column_value = ''ADMIN'')',
'and (apex_util.get_email(''STEVE'') is null',
'    or apex_util.get_email(''PAT'') is null',
'    or apex_util.get_email(''BO'') is null',
'    or apex_util.get_email(''JANE'') is null)'))
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1541796400212780889)
,p_plug_name=>'About'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h1:js-headingLevel-2'
,p_plug_template=>wwv_flow_imp.id(294311358452215853)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>8
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'    This application lets users change an employee''s salary or job, or order a new laptop for them,',
'    after getting the approval of an appropriate individual. It highlights the key features of the',
'    Oracle APEX Approvals components.',
'</p>',
'',
'<p>',
'    Any user can <i>request</i> a new laptop for an employee or a change to their job or salary.',
'    However, the APEX users <strong>BO</strong>, <strong>JANE</strong>, <strong>PAT</strong>,',
'    and <strong>STEVE</strong> must exist in your workspace to approve and administer',
'    <strong>Salary Change</strong>, <strong>Job Change</strong>, and ',
'    <strong>Laptop Request</strong> tasks.</p>',
'',
'<p>',
'    See the <strong>More Information</strong> page for background on the approvals capabilities',
'    and how the sample uses them.',
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1942943226121346784)
,p_plug_name=>'Oracle APEX Communities and Resources'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294282948967215830)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.SAMPLEAPPFOOTER'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2440853261785733577)
,p_plug_name=>'&APP_NAME.'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(294315568240215861)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'Demonstration of Approvals capabilities in Oracle APEX'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(218943637813367313)
,p_name=>'P1_MISSING_ACCOUNTS'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(218944006977370385)
,p_computation_sequence=>20
,p_computation_item=>'P1_MISSING_ACCOUNTS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select eba_demo_appr_data.missing_demo_user_accounts as missing from dual'
);
wwv_flow_imp.component_end;
end;
/
