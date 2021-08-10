provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x.
    # If you're using version 1.x, the "features" block is not allowed.
    #version = "~>2.41"
    features {}
}

resource "azurerm_resource_group" "rg" {
  #id       = "/subscriptions/b407b1af-b83f-4ddb-9e5b-03e0e600347c/resourceGroups/MasoudRG2"
  name = "MasoudRG2"
  location = "Australia East"
}
