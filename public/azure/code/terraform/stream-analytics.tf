resource "azurerm_stream_analytics_job" "main" {
  name                                     = "asa-${local.naming_suffix}"
  resource_group_name                      = azurerm_resource_group.main.name
  location                                 = azurerm_resource_group.main.location
  compatibility_level                      = "1.2"
  data_locale                              = "en-GB"
  events_late_arrival_max_delay_in_seconds = 60
  events_out_of_order_max_delay_in_seconds = 50
  events_out_of_order_policy               = "Adjust"
  output_error_policy                      = "Drop"
  streaming_units                          = 3
  sku_name                                 = "StandardV2"

  tags = var.tags

  transformation_query = <<QUERY
  SELECT *
  INTO [YourOutputAlias]
  FROM [YourInputAlias]
  QUERY

}