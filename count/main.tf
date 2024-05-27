
resource "azurerm_resource_group" "example" {
    count = 2 
  name     = "test-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
    count = var.enable_storage ? 1 :0
  name                     = "storageaccountname"
  resource_group_name      = "test-rg"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}