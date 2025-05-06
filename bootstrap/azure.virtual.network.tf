data "azurerm_virtual_network" "virtual_network" {
  name                = "PR-Lighthouse-VNET01"
  resource_group_name = "PR-Lighthouse-VirtualNetworks"
}

data "azurerm_subnet" "agents" {
  name                 = "agents"
  resource_group_name  = "PR-Lighthouse-VirtualNetworks"
  virtual_network_name = "PR-Lighthouse-VNET01"
}

data "azurerm_subnet" "private_endpoints" {
  name                 = "private_endpoints"
  resource_group_name  = "PR-Lighthouse-VirtualNetworks"
  virtual_network_name = "PR-Lighthouse-VNET01"
}
