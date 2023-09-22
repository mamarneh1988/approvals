prompt --application/shared_components/plugins/region_type/markdown_region
begin
--   Manifest
--     PLUGIN: MARKDOWN_REGION
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>20
,p_default_application_id=>7870
,p_default_id_offset=>321337877993430365
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(760348167110042146)
,p_plugin_type=>'REGION TYPE'
,p_name=>'MARKDOWN_REGION'
,p_display_name=>'Markdown Region'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','MARKDOWN_REGION'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render (',
'    p_region              in apex_plugin.t_region,',
'    p_plugin              in apex_plugin.t_plugin,',
'    p_is_printer_friendly in boolean )',
'return apex_plugin.t_region_render_result',
'as',
'    l_clob_md   clob;',
'    l_clob_html clob;',
'',
'    l_based_on  varchar2(100) := p_region.attribute_01;',
'',
'    l_to_return apex_plugin.t_region_render_result;',
'begin',
'',
'    if l_based_on = ''INLINE'' then',
'        l_clob_md := p_region.attribute_02;',
'    elsif l_based_on = ''APP_STATIC_FILE'' then',
'        begin',
'            select replace(to_clob( file_content ),''#''||''APP_FILES''||''#'',V(''APP_FILES''))',
'              into l_clob_md',
'              from apex_application_static_files',
'             where application_id = :APP_ID',
'               and file_name      = p_region.attribute_03',
'               and mime_type      like ''text/%'';',
'        exception',
'            when no_data_found then',
'                raise_application_error( -20000, ''Application static file "'' || p_region.attribute_03 || ''" not found or is not text/%'' );',
'        end;',
'    end if;',
'    l_clob_html := apex_markdown.to_html( l_clob_md );',
'',
'    apex_util.prn(',
'        p_clob      => ''<div class="is-markdownified">'' || l_clob_html || ''</div>'',',
'        p_escape    => false );',
'',
'    return l_to_return;',
'end render;'))
,p_api_version=>2
,p_render_function=>'render'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(760351430546169432)
,p_plugin_id=>wwv_flow_imp.id(760348167110042146)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Source'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'INLINE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(760352176160172982)
,p_plugin_attribute_id=>wwv_flow_imp.id(760351430546169432)
,p_display_sequence=>10
,p_display_value=>'Inline Content'
,p_return_value=>'INLINE'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(760352603781174585)
,p_plugin_attribute_id=>wwv_flow_imp.id(760351430546169432)
,p_display_sequence=>20
,p_display_value=>'Application Static File'
,p_return_value=>'APP_STATIC_FILE'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(760353010688179294)
,p_plugin_id=>wwv_flow_imp.id(760348167110042146)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Content'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(760351430546169432)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'INLINE'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(760353600139180912)
,p_plugin_id=>wwv_flow_imp.id(760348167110042146)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'File Name'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(760351430546169432)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'APP_STATIC_FILE'
);
wwv_flow_imp.component_end;
end;
/
