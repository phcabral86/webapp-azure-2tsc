# PostgreSQL Flexible Server
#resource "azurerm_postgresql_flexible_server" "pg" {
#  name                   = var.postgresql_name
#  resource_group_name    = azurerm_resource_group.rg.name
#  location               = azurerm_resource_group.rg.location
#  administrator_login    = var.postgresql_admin
#  administrator_password = azurerm_key_vault_secret.pg_password.value
#  storage_mb             = 32768
#  sku_name               = var.postgresql_sku
#  version                = var.postgresql_version
#  zone                   = "2"
#}

# Criação do banco de dados

#resource "azurerm_postgresql_flexible_server_database" "pg_database" {
#  name      = "pgwebappdb"
#  server_id = azurerm_postgresql_flexible_server.pg.id
#  collation = "en_US.utf8"
#  charset   = "UTF8"
#}
