location                                  = "westeurope"
resource_name_location_short              = "weu"
organization_name                         = "ProRail"
use_self_hosted_agents                    = true
azure_devops_project                      = "CloudRegie"
resource_name_workload                    = "prcr"
container_instance_count                  = 2
container_instance_container_cpu          = 1
container_instance_container_memory       = 2
container_instance_use_availability_zones = false
nat_gateway_creation_enabled              = false
repository_postfix                        = ""
repository_postfix_template               = "template"
address_space                             = "10.242.12.0/24"
approvers = {
  user1 = "frans.koster@ka.testprorail.nl"
  user2 = "david.deklerk@ka.testprorail.nl"
}
