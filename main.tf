provider "azurerm" {
    # The "feature" block is required for AzureRM provider 2.x.
    # If you're using version 1.x, the "features" block is not allowed.
    #version = "~>2.41"
    features {}
}

resource "azurerm_resource_group" "tf_test" {
  #id       = "/subscriptions/b407b1af-b83f-4ddb-9e5b-03e0e600347c/resourceGroups/MasoudRG2"
  name = "tfmainrg"
  location = "Australia East"
}

/*
variable "imagebuild" {
  type        = string
  description = "Latest Image Build"
}
*/

resource "azurerm_container_group" "tfcg_test" {
  name                      = "weatherapi"
  location                  = azurerm_resource_group.tf_test.location
  resource_group_name       = azurerm_resource_group.tf_test.name

  ip_address_type     = "public"
  dns_name_label      = "binarythistlewa"
  os_type             = "Linux"

  container {
      name            = "weatherapi"
      image           = "masoudbabaei/weatherapi"
        cpu             = "1"
        memory          = "1"

        ports {
            port        = 80
            protocol    = "TCP"
        }
  }
}