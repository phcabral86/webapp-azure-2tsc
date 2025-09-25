# MySQL Flexible Server
resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = var.mysql_name
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  administrator_login    = var.mysql_admin
  administrator_password = azurerm_key_vault_secret.my_password.value
  
  storage {
    size_gb = 20  # Tamanho mínimo para MySQL Flexible
  }

  sku_name   = var.mysql_sku  # Ex: "B_Standard_B1s"
  version    = var.mysql_version
  zone       = "2"

  # Configurações recomendadas para ambiente Petrobras:
  backup_retention_days = 7
  geo_redundant_backup_enabled = false
}

# Criação do banco de dados MySQL
resource "azurerm_mysql_flexible_database" "mysql_database" {
  name      = var.mysql_database
  resource_group_name    = azurerm_resource_group.rg.name
  server_name = azurerm_mysql_flexible_server.mysql.name
  charset   = "utf8mb4"
  collation = "utf8mb4_unicode_ci"
}

resource "azurerm_mysql_flexible_server_firewall_rule" "allow_azure_services" {
  name                = "AllowAzureServices"
  server_name         = azurerm_mysql_flexible_server.mysql.name
  resource_group_name = azurerm_resource_group.rg.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

