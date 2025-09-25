output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "azurerm_key_vault_name" {
  value = azurerm_key_vault.vault.name
}

output "azurerm_key_vault_id" {
  value = azurerm_key_vault.vault.id
}

output "mysql_fqdn" {
  description = "MySQL server fully-qualified domain name"
  value       = azurerm_mysql_flexible_server.mysql.fqdn
}
