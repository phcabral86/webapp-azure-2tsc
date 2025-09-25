variable "resource_group_location" {
  type        = string
  description = "Localização dos recursos"
  default     = "uksouth"
}

variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
  default     = "rg-webapp-fiap"
}

variable "vault_name" {
  type        = string
  description = "The name of the key vault to be created. The value will be randomly generated if blank."
  default     = "kv-webapp-fiap"
}

variable "db_password" {
  description = "The database password (stored in Key Vault secret)"
  type        = string
  sensitive   = true
  default     = "Teste##1234"
}

variable "key_name" {
  type        = string
  description = "The name of the key to be created. The value will be randomly generated if blank."
  default     = ""
}

variable "sku_name" {
  type        = string
  description = "The SKU of the vault to be created."
  default     = "standard"
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "The sku_name must be one of the following: standard, premium."
  }
}

variable "postgresql_name" {
  type        = string
  description = "Nome do servidor PostgreSQL"
  default     = "postgres-webapp"
}

variable "postgresql_admin" {
  type        = string
  description = "Nome usuário Admin do servidor POstgreSQL"
  default     = "pgadmin"
}

variable "postgresql_sku" {
  type        = string
  description = "SKU do servidor PostgreSQL"
  default     = "B_Standard_B1ms"
}

variable "postgresql_version" {
  type        = string
  description = "Versão do servidor PostgreSQL"
  default     = "13"
}

variable "postgresql_database" {
  type        = string
  description = "Nome do banco de dados PostgreSQL"
  default     = "pgwebappdb"
}

variable "mysql_name" {
  type        = string
  description = "Nome do servidor MySQL"
  default     = "mysql-webapp-pf0807"
}

variable "mysql_admin" {
  type        = string
  description = "Nome usuário Admin do servidor MySQL"
  default     = "myadmin"
}

variable "mysql_sku" {
  type        = string
  description = "SKU do servidor MySQL"
  default     = "B_Standard_B1ms"
}

variable "mysql_version" {
  type        = string
  description = "Versão do servidor MySQL"
  default     = "8.0.21"
}

variable "mysql_database" {
  type        = string
  description = "Nome do banco de dados MySQL"
  default     = "mywebappdb"
}

variable "webapp_name" {
  type        = string
  description = "Nome do WebApp"
  default     = "WebApp-lojavirtual"
}

variable "webapp_plan" {
  type        = string
  description = "Nome do ASP"
  default     = "ASP-lojavirtual"
}


variable "enviroment" {
  type        = string
  description = "Definição do ambiente da aplicação (DEV, HMG, PRD)"
  default     = "DEV"
  validation {
    condition      = contains(["DEV", "HMG", "PRD"], var.enviroment)
    error_message = "A ambiente deve ser definido com um dos seguintes valores: DEV, HMG, PRD"
  }
}

variable "key_permissions" {
  type        = list(string)
  description = "List of key permissions."
  default     = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update", "GetRotationPolicy", "SetRotationPolicy"]
}

variable "secret_permissions" {
  type        = list(string)
  description = "List of secret permissions."
  default     = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
}

