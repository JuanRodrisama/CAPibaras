name                = "${random_pet.prefix.id}-subnet"
address_space       = ["10.0.0.0/16"]
location            = "eastus"
resource_group_name = "${random_pet.prefix.id}-rg"

