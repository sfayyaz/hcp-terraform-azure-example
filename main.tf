provider "azurerm" {
  features {}
}

locals {
  base_name = "${var.prefix}hcp-vcs-${var.environment}"
  common_tags = {
    Environment = var.environment
    Owner = var.prefix
  }
locals {
  base_name = "${var.prefix}hcp-vcs-${var.environment}"
  common_tags = {
    Environment = var.environment
    Owner       = var.prefix
    Project     = "8675309"
  }
}
}

resource "azurerm_resource_group" "web" {
  name     = local.base_name
  location = var.location
  
  tags = local.common_tags
}

resource "azurerm_virtual_network" "web" {
  name                = local.base_name
  resource_group_name = azurerm_resource_group.web.name
  location            = azurerm_resource_group.web.location

  address_space = [var.address_space]
  
  tags = local.common_tags
}
