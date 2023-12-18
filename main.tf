resource "azurerm_private_link_service" "private_link_service" {
  for_each                                    = local.private_link_service
  name                                        = each.value.name
  location                                    = each.value.location
  resource_group_name                         = var.resource_group_output[each.value.resource_group_name].name
  tags                                        = each.value.tags == null ? var.default_values.tags : each.value.tags
  load_balancer_frontend_ip_configuration_ids = flatten([for load_balancer in var.load_balancer_output : load_balancer.id if contains(each.value.load_balancer_name, load_balancer.name) == true])


  dynamic "nat_ip_configuration" {
    for_each = each.value.nat_ip_configuration
    content {
      name                       = nat_ip_configuration.value.name
      private_ip_address         = nat_ip_configuration.value.private_ip_address
      private_ip_address_version = nat_ip_configuration.value.private_ip_address_version
      subnet_id                  = var.subnet_output[each.value.subnet_name].id
      primary                    = true
    }
  }
}


# resource "azurerm_private_link_service" "private_link_service" {
#   for_each                                    = local.private_link_service
#   name                                        = each.value.name
#   location                                    = each.value.location
#   resource_group_name                         = var.resource_group_output[each.value.resource_group_name].name
#   tags                                        = each.value.tags == null ? var.default_values.tags : each.value.tags
#   load_balancer_frontend_ip_configuration_ids = flatten([for load_balancer in var.load_balancer_output : load_balancer.id if contains(each.value.load_balancer_name, load_balancer.name) == true])

#   nat_ip_configuration {
#     name                       = each.value.name
#     private_ip_address         = each.value.private_ip_address
#     private_ip_address_version = each.value.private_ip_address_version
#     subnet_id                  = element([for subnet in var.subnet_output : subnet.id if subnet.name == each.value.subnet_name], 0)
#     primary                    = each.value.primary
#   }
# }

