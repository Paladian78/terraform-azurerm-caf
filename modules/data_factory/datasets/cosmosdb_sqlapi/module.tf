resource "azurecaf_name" "dataset" {
  name          = var.settings.name
  resource_type = "azurerm_data_factory" #"azurerm_data_factory_dataset_azure_blob"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
  use_slug      = var.global_settings.use_slug
}
resource "azurerm_data_factory_dataset_cosmosdb_sqlapi" "dataset" {
  name                  = azurecaf_name.dataset.result
#   resource_group_name   = var.resource_group_name
  data_factory_id       = var.data_factory_id
  linked_service_name   = var.linked_service_name
  folder                = try(var.settings.folder, null)
  description           = try(var.settings.description, null)
  annotations           = try(var.settings.annotations, null)
  parameters            = try(var.settings.parameters, null)
  additional_properties = try(var.settings.additional_properties, null)
  collection_name       = try(var.settings.collection_name, null)

  dynamic "schema_column" {
    for_each = try(var.settings.schema_column, null) != null ? [var.settings.schema_column] : []

    content {
      name        = schema_column.value.name
      type        = lookup(schema_column.value, "type", null)
      description = lookup(schema_column.value, "description", null)
    }
  }
}
