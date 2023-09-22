prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.0'
,p_default_workspace_id=>20
,p_default_application_id=>7870
,p_default_id_offset=>321337877993430365
,p_default_owner=>'ORACLE'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(294419281410215980)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(294272811445215818)
,p_default_dialog_template=>wwv_flow_imp.id(294267649979215811)
,p_error_template=>wwv_flow_imp.id(294257687337215801)
,p_printer_friendly_template=>wwv_flow_imp.id(294272811445215818)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(294257687337215801)
,p_default_button_template=>wwv_flow_imp.id(294416203109215963)
,p_default_region_template=>wwv_flow_imp.id(294343348039215884)
,p_default_chart_template=>wwv_flow_imp.id(294343348039215884)
,p_default_form_template=>wwv_flow_imp.id(294343348039215884)
,p_default_reportr_template=>wwv_flow_imp.id(294343348039215884)
,p_default_tabform_template=>wwv_flow_imp.id(294343348039215884)
,p_default_wizard_template=>wwv_flow_imp.id(294343348039215884)
,p_default_menur_template=>wwv_flow_imp.id(294355728737215894)
,p_default_listr_template=>wwv_flow_imp.id(294343348039215884)
,p_default_irr_template=>wwv_flow_imp.id(294338731653215881)
,p_default_report_template=>wwv_flow_imp.id(294381220381215917)
,p_default_label_template=>wwv_flow_imp.id(294413744163215958)
,p_default_menu_template=>wwv_flow_imp.id(294417891517215966)
,p_default_calendar_template=>wwv_flow_imp.id(294417972901215967)
,p_default_list_template=>wwv_flow_imp.id(294397669130215938)
,p_default_nav_list_template=>wwv_flow_imp.id(294409468978215951)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(294409468978215951)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(294404034842215943)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(294285750039215831)
,p_default_dialogr_template=>wwv_flow_imp.id(294282948967215830)
,p_default_option_label=>wwv_flow_imp.id(294413744163215958)
,p_default_required_label=>wwv_flow_imp.id(294415066504215959)
,p_default_navbar_list_template=>wwv_flow_imp.id(294403614309215942)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/22.2/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/
