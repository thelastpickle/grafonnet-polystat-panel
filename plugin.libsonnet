local polystatPanel = {
  /**
   * Returns a new polystat panel that can be added in a row.
   * It requires the pie chart panel plugin in grafana, which needs to be explicitly installed.
   *
   * @param title The title of the Polystat panel.
   * @param description Description of the panel
   * @param span Width of the panel
   * @param min_span Min span
   * @param datasource Datasource
   * @return A json that represents a polygon chart panel
   */
  new(
    title,
    description=null,
    transparent=null,
    span=null,
    min_span=null,
    datasource=null,
    height=null,
    saved_composites=null,
    saved_overrides=null,
    colors=null,

    animation_speed=null,
    columns=null,
    column_auto_size=null,
    display_limit=null,
    default_click_through=null,
    default_click_through_new_tab=null,
    default_click_through_sanitize=null,
    font_auto_scale=null,
    font_size=null,
    font_type=null,
    global_unit_format=null,
    global_decimals=null,
    global_display_mode=null,
    global_operator_name=null,
    global_display_text_triggered_empty=null,
    global_thresholds=null,
    gradient_enabled=null,
    hexagon_sort_by_direction=null,
    hexagon_sort_by_field=null,
    max_metrics=null,
    polygon_border_size=null,
    polygon_border_color=null,
    polygon_global_fill_color=null,
    radius=null,
    radius_auto_size=null,
    rows=null,
    row_auto_size=null,
    shape=null,
    tooltip_display_mode=null,
    tooltip_display_text_triggered_empty=null,
    tooltip_font_size=null,
    tooltip_font_type=null,
    tooltip_primary_sort_direction=null,
    tooltip_primary_sort_field=null,
    tooltip_secondary_sort_direction=null,
    tooltip_secondary_sort_field=null,
    tooltip_timestamp_enabled=null,
    value_enabled=null,
    value_maps=null,
    range_maps=null,
    mapping_type=null,
  ):: {
    type: 'grafana-polystat-panel',
    title: title,
    datasource: datasource,
    [if transparent == true then 'transparent']: transparent,
    [if description != null then 'description']: description,
    [if span != null then 'span']: span,
    [if min_span != null then 'minSpan']: min_span,
    [if height != null then 'height']: height,
    [if saved_overrides != null then 'savedOverrides']: saved_overrides,
    [if saved_composites != null then 'savedComposites']: saved_composites,
    [if colors != null then 'colors']: colors,
    mappingTypes: [
        {
          name: 'value to text',
          value: 1,
        },
        {
          name: 'range to text',
          value: 2,
        },
      ],
      [if mapping_type != null then 'mappingType']:
        if mapping_type == 'value'
        then
          1
        else if mapping_type == 'range'
        then
          2
        else
          mapping_type,
    [if value_maps != null then 'valueMaps']: value_maps,
    [if range_maps != null then 'rangeMaps']: range_maps,

    polystat: {
      [if animation_speed != null then 'animationSpeed']: animation_speed,
      [if columns != null then 'columns']: columns,
      [if column_auto_size != null then 'columnAutoSize']: column_auto_size,
      [if display_limit != null then 'displayLimit']: display_limit,
      [if default_click_through != null then 'defaultClickThrough']: default_click_through,
      [if default_click_through_new_tab != null then 'defaultClickThroughNewTab']: default_click_through_new_tab,
      [if default_click_through_sanitize != null then 'defaultClickThroughSanitize']: default_click_through_sanitize,
      [if font_auto_scale != null then 'fontAutoScale']: font_auto_scale,
      [if font_size != null then 'fontSize']: font_size,
      [if font_type != null then 'fontType']: font_type,
      [if global_unit_format != null then 'globalUnitFormat']: global_unit_format,
      [if global_decimals != null then 'globalDecimals']: global_decimals,
      [if global_display_mode != null then 'globalDisplayMode']: global_display_mode,
      [if global_operator_name != null then 'globalOperatorName']: global_operator_name,
      [if global_display_text_triggered_empty != null then 'globalDisplayTextTriggeredEmpty']: global_display_text_triggered_empty,
      [if global_thresholds != null then 'globalThresholds']: global_thresholds,
      [if gradient_enabled != null then 'gradientEnabled']: gradient_enabled,
      [if hexagon_sort_by_direction != null then 'hexagonSortByDirection']: hexagon_sort_by_direction,
      [if hexagon_sort_by_field != null then 'hexagonSortByField']: hexagon_sort_by_field,
      [if max_metrics != null then 'maxMetrics']: max_metrics,
      [if polygon_border_size != null then 'polygonBorderSize']: polygon_border_size,
      [if polygon_border_color != null then 'polygonBorderColor']: polygon_border_color,
      [if polygon_global_fill_color != null then 'polygonGlobalFillColor']: polygon_global_fill_color,
      [if radius != null then 'radius']: radius,
      [if radius_auto_size != null then 'radiusAutoSize']: radius_auto_size,
      [if rows != null then 'rows']: rows,
      [if row_auto_size != null then 'rowAutoSize']: row_auto_size,
      [if shape != null then 'shape']: shape,
      [if tooltip_display_mode != null then 'tooltipDisplayMode']: tooltip_display_mode,
      [if tooltip_display_text_triggered_empty != null then 'tooltipDisplayTextTriggeredEmpty']: tooltip_display_text_triggered_empty,
      [if tooltip_font_size != null then 'tooltipFontSize']: tooltip_font_size,
      [if tooltip_font_type != null then 'tooltipFontType']: tooltip_font_type,
      [if tooltip_primary_sort_direction != null then 'tooltipPrimarySortDirection']: tooltip_primary_sort_direction,
      [if tooltip_primary_sort_field != null then 'tooltipPrimarySortField']: tooltip_primary_sort_field,
      [if tooltip_secondary_sort_direction != null then 'tooltipSecondarySortDirection']: tooltip_secondary_sort_direction,
      [if tooltip_secondary_sort_field != null then 'tooltipSecondarySortField']: tooltip_secondary_sort_field,
      [if tooltip_timestamp_enabled != null then 'tooltipTimestampEnabled']: tooltip_timestamp_enabled,
      [if value_enabled != null then 'valueEnabled']: value_enabled,
    },
    targets: [],
    _nextTarget:: 0,
    addTarget(target):: self {
      local nextTarget = super._nextTarget,
      _nextTarget: nextTarget + 1,
      targets+: [target { refId: std.char(std.codepoint('A') + nextTarget) }],
    },
  },
};


{
  polystatPanel:: polystatPanel,
}
