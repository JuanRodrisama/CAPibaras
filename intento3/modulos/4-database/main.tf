#Recurso 1
resource "azurerm_mssql_server" "server" {
  name                         = var.name_server
  resource_group_name          = var.name_rg
  location                     = var.location
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  version                      = var.version_sql
}

#Recurso 2
resource "azurerm_mssql_database" "db" {
  name                         = var.name_db
  server_id                    = azurerm_mssql_server.server.id
}