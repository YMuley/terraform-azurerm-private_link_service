
locals {  
    private_link_service = {for private_link_service in var.private_link_service_list : format("%s/%s",private_link_service.resource_group_name,private_link_service.name) => private_link_service}
}