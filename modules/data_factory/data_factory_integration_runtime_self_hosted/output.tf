output "id" {
  value       = azurerm_data_factory_integration_runtime_self_hosted.dfirsh.id
  description = "The ID of the Data Factory runtime."
}
output "name" {
  value       = azurecaf_name.dfirsh.result
  description = "The name of the Data Factory runtime."
}
output "auth_key_1" {
  value       = azurerm_data_factory_integration_runtime_self_hosted.dfirsh.primary_authorization_key
  description = "The primary integration runtime authentication key."
}
output "auth_key_2" {
  value       = azurerm_data_factory_integration_runtime_self_hosted.dfirsh.secondary_authorization_key
  description = "The secondary integration runtime authentication key."
}
