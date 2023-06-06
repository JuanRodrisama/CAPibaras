#Recurso 1
resource "azurerm_mssql_server" "server" {
  name                         = "servercapibara"
  resource_group_name          = var.name_rg
  location                     = var.location
  administrator_login          = "adminuser"
  administrator_login_password = "P@ssw0rd"
  version                      = "12.0"
}

#Recurso 2
resource "azurerm_mssql_database" "db" {
  name                         = "dbcapibara"
  server_id                    = azurerm_mssql_server.server.id
}