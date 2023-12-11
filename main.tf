# resource "azurerm_private_link_service" "private_link_service" {
#   for_each            = local.private_link_service
#   name                = each.value.name
#   location            = each.value.location
#   resource_group_name = var.resource_group_output[each.value.resource_group_name].name
#   subnet_id           = var.subnet_output[format("%s/%s", each.value.virtual_network_name, each.value.subnet_name)].id
#   load_balancer       = var.load_balancer_output
#   tags                = each.value.tags == null ? var.default_values.tags : each.value.tags

#   dynamic "nat_ip_configuration" {
#     for_each = var.nat_ip_configurations

#     content {
#       name                       = nat_ip_configuration.value.name
#       private_ip_address         = nat_ip_configuration.value.private_ip_address
#       private_ip_address_version = nat_ip_configuration.value.private_ip_address_version
#       primary                    = nat_ip_configuration.value.primary
#     }
#   }
# }
