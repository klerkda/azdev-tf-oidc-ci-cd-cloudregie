data "azurerm_virtual_network" "virtual_network" {
  name                = "PR-CLRP-VNET01"
  resource_group_name = "PR-CLRP-VirtualNetworks"
}

data "azurerm_subnet" "agents" {
  name                 = "agents"
  resource_group_name  = "PR-CLRP-VirtualNetworks"
  virtual_network_name = "PR-CLRP-VNET01"
}

data "azurerm_subnet" "private_endpoints" {
  name                 = "private_endpoints"
  resource_group_name  = "PR-CLRP-VirtualNetworks"
  virtual_network_name = "PR-CLRP-VNET01"
}
