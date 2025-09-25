# App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = var.webapp_plan
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "B1"
  os_type             = "Linux"
}


# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                  = var.webapp_name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  service_plan_id       = azurerm_service_plan.appserviceplan.id
  depends_on            = [azurerm_service_plan.appserviceplan]
  https_only            = true

  identity {
    type = "SystemAssigned"
  }

  # app_settings como argumento de nível superior
  app_settings = {
    KEY_VAULT_URL                 = azurerm_key_vault.vault.vault_uri
    DB_HOST                       = azurerm_mysql_flexible_server.mysql.fqdn
    DB_NAME                       = azurerm_mysql_flexible_database.mysql_database.name
    DB_USER                       = var.mysql_admin
    DB_PORT                       = "3306"
    SECRET_KEY                    = "@Microsoft.KeyVault(VaultName=${azurerm_key_vault.vault.name};SecretName=${azurerm_key_vault_secret.my_password.name})"
    SCM_DO_BUILD_DURING_DEPLOYMENT = "true"  # No Terraform sempre como string
    MYSQL_CHARSET                 = "utf8mb4"
    MYSQL_COLLATION               = "utf8mb4_unicode_ci"
  }

  # site_config separado
  site_config {
    application_stack {
      python_version = "3.12"  # Define explicitamente a versão do Python
    }
  }
}
