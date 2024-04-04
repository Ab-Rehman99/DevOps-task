# Create Vnets
resource "azurerm_virtual_network" "gateway-vnet" {
  name                = "Application-gateway-vnet"
  resource_group_name = "${azurerm_resource_group.application-rg.name}"
  location            = "${azurerm_resource_group.application-rg.location}"
  address_space       = ["10.0.0.0/16"]
}


# Create Subnets
resource "azurerm_subnet" "gateway-subnet" {
  name                 = "default"
  resource_group_name = "${azurerm_resource_group.application-rg.name}"
  virtual_network_name = "${azurerm_virtual_network.gateway-vnet.name}"
  address_prefixes       = ["10.0.0.0/24"]
}



# Create Dynamic Public IP Addresses
resource "azurerm_public_ip" "pip" {
  name                         = "gateway-pip"
  resource_group_name = "${azurerm_resource_group.application-rg.name}"
  location            = "${azurerm_resource_group.application-rg.location}"
  allocation_method = "Static"
  sku = "Standard"
}

