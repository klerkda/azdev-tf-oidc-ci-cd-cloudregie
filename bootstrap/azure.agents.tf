module "azure_devops_agents" {
  source           = "Azure/avm-ptn-cicd-agents-and-runners/azurerm"
  version          = "0.3.2"
  enable_telemetry = false

  count = var.use_self_hosted_agents ? 1 : 0

  resource_group_creation_enabled                      = false
  resource_group_name                                  = module.resource_group["agents"].name
  postfix                                              = local.resource_names.agent_compute_postfix_name
  container_instance_name_prefix                       = local.resource_names.container_instance_prefix_name
  container_registry_name                              = local.resource_names.container_registry_name
  location                                             = var.location
  compute_types                                        = [var.self_hosted_agent_type]
  container_instance_count                             = 4
  version_control_system_type                          = "azuredevops"
  version_control_system_personal_access_token         = var.personal_access_token
  version_control_system_organization                  = local.organization_name_url
  version_control_system_pool_name                     = azuredevops_agent_pool.this[0].name
  virtual_network_creation_enabled                     = false
  virtual_network_id                                   = data.azurerm_virtual_network.virtual_network.id
  container_app_subnet_id                              = data.azurerm_subnet.agents.id
  container_instance_subnet_id                         = data.azurerm_subnet.agents.id
  use_private_networking                               = false
  container_registry_private_dns_zone_creation_enabled = false
  container_registry_private_endpoint_subnet_id        = data.azurerm_subnet.private_endpoints.id
  container_instance_use_availability_zones            = var.agent_use_availability_zones
  depends_on                                           = [azuredevops_pipeline_authorization.service_connection, azuredevops_pipeline_authorization.environment, azuredevops_pipeline_authorization.agent_pool]
}
